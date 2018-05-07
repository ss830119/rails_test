module RestfulResource

  extend ActiveSupport::Concern

  included do
    helper_method :model_class, :model_class_name, :current_collection, :current_object

    def index

      respond_to do |format|
        format.xlsx {
          @current_collection = default_scope
          render filename: "#{model_class.model_name.human}.xlsx", xlsx: 'index'
        }
        format.html {

        }
      end  
    end

    def new
      @current_object = default_scope.new
    end

    def create
      @current_object = default_scope.new(params_permit)

      if @current_object.save
        @message = "建立成功."

        respond_to do |format|
          format.js {

          }
          format.html {
            flash[:success] = @message
            redirect_to action_after_create
          }
        end       
      else
        @message = @current_object.errors.full_messages.to_sentence
        respond_to do |format|
          format.js {

          }
          format.html {
            flash[:error] = @message
            render action: :new
          }
        end 
      end
    end

    def show
    end

    def edit
      render action: :new
    end


    def update
      if current_object.update(params_permit)

        respond_to do |format|
          format.js {

          }
          format.html {
            redirect_to action_after_update
          }
        end   
      else
        @message = @current_object.errors.full_messages.to_sentence
        respond_to do |format|
          format.js {

          }
          format.html {
            flash[:error] = @message
            render action: :new
          }
        end         
      end
    end

    def event
      if current_object.aasm(:status).events(:permitted => true).map(&:name).include?(params[:event].to_sym)
        current_object.send(params[:event])
        current_object.save!
      else

      end
      @message = "完成."

      respond_to do |format|
        format.js {
          render action: :update
        }
        format.html {
          flash[:success] = @message
          redirect_to action_after_update
        }
      end  
    end

    def sort
      @current_collection = current_collection.where(id: params[:sort])

      @current_collection.each do |object|
        object.update!(priority: params[:sort].index("#{object.id}"))
      end

      @message = "完成."

      render json: 'sort_success'
    end

    def destroy
      current_object.destroy

      respond_to do |format|
        format.js {

        }
        format.html {
          redirect_to action_after_destroy
        }
      end     
    end


    private

    def model_class_name
      self.class.to_s.demodulize.gsub('Controller', '').singularize
    end

    def model_class
      model_class_name.constantize
    end

    def params_key
      model_class_name.underscore.to_sym
    end

    def default_scope
      model_class.search(params.permit!.to_h).all
    end

    def current_collection
      @current_collection ||= default_scope.page(params[:page])
    end

    def current_object
      @current_object ||= default_scope.find(params[:id])
    end

    def params_permit
      params.require(params_key).permit(*permitted_attributes)
    end

    def action_after_create
      url_for action: :index
    end

    def action_after_update
      request.referrer || url_for(action: :index)
    end
    alias :action_after_destroy :action_after_update

  end




end