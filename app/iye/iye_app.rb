require "psych"
require "yaml"

class IyeApp

  def initialize
    @path = Rails.root.to_s + "/config/locales/**/*.yml"
    @store = IyeStore.new

  end

  attr_accessor :store

  def execute
    load_translations

    store.create_missing_keys

    return store
  end

  def load_translations
    files = Dir.glob(@path)
    files.each {|file|
      yaml = YAML.load_file(file)
      store.from_yaml(yaml, file)
    }
  end

  def save_translations
    files = store.to_yaml
    files.each {|file, yaml|
      File.open(file, "w", encoding: "utf-8") {|f| f << yaml.to_yaml}
    }
  end

end