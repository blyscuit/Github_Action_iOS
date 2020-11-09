# frozen_string_literal: true

class ENVGenerator
  def initialize
    @env_path = './.env'
  end

  def append(key:, value:, description:)
    File.new(@env_path, 'w') unless File.exist?(@env_path)
    envs = current_envs.append(env_variable_from(key: key, value: value, description: description))
    write(envs: envs)
  end

  def clear
    File.new(@env_path, 'w')
  end

  private

  def current_envs
    File.read(@env_path)
        .to_s
        .split("\n\n")
        .map { |variable| variable.split("\n").filter { |item| !item.empty? } }
        .map { |components| env_variable_from_components(components) }
  end

  def env_variable_from_components(components)
    first_line = components[0]
    second_line = components[1]
    key = second_line.split('=')[0]
    value = /^\'(.*)\'$/.match(second_line.split('=')[1])[1]
    env_variable_from(
      key: key,
      value: value,
      description: first_line.gsub('# ', '').strip
    )
  end

  def env_variable_from(key:, value:, description:)
    {
      key: key,
      value: value,
      description: description
    }
  end

  def write(envs:)
    string = envs
             .sort { |a, b| a[:key] <=> b[:key] }
             .map { |env| ["# #{env[:description]}", "#{env[:key]}=\'#{env[:value]}\'"].join("\n") }
             .join("\n\n")
    File.open(@env_path, 'w') { |file| file.write(string) }
  end
end
