class IyeController < BackendsController

  def index
    @iye = IyeApp.new().execute()
    filters = params[:filters]
    options = {}
    if filters
      options[:key] = /#{filters["key"]}/ if filters["key"].to_s.size > 0
      options[:text] = /#{filters["text"]}/i if filters["text"].to_s.size > 0
    end
    @translations = @iye.filter_keys(options)

    #render json: @translations
  end

  def create
    @iye = IyeApp.new().execute()
    translations = params[:translations]
    translations.each {|name, text|
      @iye.translations[name].text = text
    }    

    files = @iye.to_yaml
    files.each {|file, yaml|
      File.open(file, "w", encoding: "utf-8") {|f| f << yaml.to_yaml}
    }
    redirect_to iye_index_path
  end


end
