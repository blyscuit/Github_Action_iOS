require 'phrase'
require 'json'
require 'dotenv/load'

PROJECT_ID = '781354e89f1841735a517930e49dd4dc'
ALL_LOCALE = {
    'en' => 'd0fc60e631deac13f8fb509fbcc9ae3d', # the default source of truth
    'th' => 'eee5089e88ab1760e893567b17106aad',
}

REGEX = /%s|%d|%+[1-9]\$s|%+[1-9]\$d/

def setup
    # Setup authorization
    Phrase.configure do |config|
        # Or configure API key authorization: Token
        config.api_key['Authorization'] = ENV['PHRASEAPP_TOKEN']
        config.api_key_prefix['Authorization'] = 'token'
    end

    api_instance = Phrase::LocalesApi.new
    
    ALL_LOCALE.each do |key, locale_id|
        temp_fite = api_instance.locale_download(PROJECT_ID, locale_id, file_format: 'json')
        file_path = "./translation-#{key}.json"
        FileUtils.cp(temp_fite.path, file_path)
        temp_fite.delete
    end
end

def sanity_check_localization
    all_files = ALL_LOCALE.keys.collect { |k| JSON.load(File.open("./translation-#{k}.json")) }
    en_json = all_files.first
    testify_list = all_files[1..]
    issue_desc = ''
    matched = true
    testify_list.each_with_index do |locale, index|
        issue_desc += "On locale: #{ALL_LOCALE.keys[index + 1]}\n"
        en_json.each do |en_key, en_value|
            if (locale.has_key? en_key)
                if (en_value['message'].scan(REGEX).size != locale[en_key]['message'].scan(REGEX).size)
                    issue_desc += "Incorrect regex matched: #{en_key}\n"
                    puts "::warning ::Incorrect regex matched: #{en_key}\n"
                end
            else
                is_skipped = en_value.has_key?('description') ? en_value['description'].include?('skip automate check') : false
                if !is_skipped
                    issue_desc += "Missing translation: #{en_key}\n"
                    puts "::warning ::Missing translation: #{en_key}\n"
                    matched = false
                end
            end
        end
    end
    {desc: issue_desc, matched: matched}
end

def show_error(result:)
    if !result
        puts "::error ::Keys missing translation"
    end
end

setup

checks = sanity_check_localization
puts sanity_check_localization[:desc]
show_error(result: checks[:matched])
