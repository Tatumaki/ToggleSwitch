require "toggle_switch/version"

class ToggleSwitch
  @@nest = Array.new
  def self.reload file_or_hash
    if file_or_hash.is_a?(Hash)
      @@config = file_or_hash   
    else
      @@config = YAML.load_file(file_or_hash)
    end
  end

  def self.load file_or_hash
    reload file_or_hash
  end

  def self.get_nested_hash
    config = @@config.dup
    @@nest.each do |nest|
      return nil unless config[nest.to_s] || config[nest.to_sym]
      config = config[nest.to_s] || config[nest.to_sym]
    end
    return config
  end

  def self.push_nest key
    @@nest << key
    get_nested_hash
  end

  def self.pop_nest
    @@nest.pop
    get_nested_hash
  end

  def self.fetch key
    push_nest key.to_s
    return self
  end

  def self.[] key
    fetch key
  end

  def self.run
    config = get_nested_hash
    if config
      yield
    end
    @@nest.clear
  end
end

