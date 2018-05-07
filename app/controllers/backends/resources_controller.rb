class Backends::ResourcesController < BackendsController
  before_action :breadcrumb

  include RestfulResource

  def breadcrumb
    begin 
    add_breadcrumb model_class.model_name.human, url_for(action: :index)
    rescue
      
    end
    
    begin 
      add_breadcrumb current_object.name, url_for(action: :show)
    rescue

    end
  end

end
