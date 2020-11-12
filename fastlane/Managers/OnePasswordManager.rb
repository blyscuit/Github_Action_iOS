# frozen_string_literal: true

class OnePasswordManager
  def initialize(subdomain:, email:, secret:, master_password:)
    op = execute('which op')
    @token = execute("echo #{master_password} | #{op} signin #{subdomain} #{email} #{secret} --raw")
  end

  def value(field_name:, item_name:, vault_name: nil)
    item = item(name: item_name, vault_name: vault_name)
    puts "#{item}"
    puts "#{field_name}"
    # item['details']['fields'].find { |it| it['designation'] == field_name }['value']
    item['details'][field_name]
  end

  def get_items(vault_name: nil)
    command = ['list items']
    command << "--vault \"#{vault_name}\"" if vault_name
    JSON.parse(op(command: command.join(' ')))
  end

  def item(name:, vault_name: nil)
    puts "fetching vault #{(vault_name || '*').green} for #{name.green}"
    items = get_items(vault_name: vault_name)
    first_matched_item = items.find { |it| it['overview']['title'] == name }
    get_item(uuid: first_matched_item['uuid'])
  end

  private def get_item(uuid:)
    puts "fetching item with uuid: #{uuid.green}"
    JSON.parse(op(command: "get item #{uuid}"))
  end

  def op(command:)
    op = execute('which op')
    execute("#{op} #{command} --session=#{@token}")
  end

  def execute(command)
    `#{command}`.gsub("\n", '')
  end
end
