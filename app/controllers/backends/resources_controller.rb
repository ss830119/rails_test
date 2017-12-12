class Backends::ResourcesController < BackendsController


  helper_method :model_class, :model_class_name, :current_collection, :current_object

  def index

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
      respond_to do |format|
        format.js {

        }
        format.html {
          render action: :new
        }
      end         
    end
  end

  def event
    if current_object.aasm.events(:permitted => true).map(&:name).include?(params[:event].to_sym)
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

    # respond_to do |format|
    #   format.js {
    #     render tempalte: "/backends/message"
    #   }
    #   format.html {
    #     flash[:success] = @message
    #     redirect_to action_after_update
    #   }
    # end  
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

  protected

  def model_class_name
    # 將 Controller 的名稱去除可能的 namespace 後再拿掉 Controller 的字串，然後再單數化
    self.class.to_s.demodulize.gsub('Controller', '').singularize
  end

  def model_class
    # 將前面取得的 model_class_name 字串常數化
    model_class_name.constantize
  end

  def params_key
    # 將前面的 model_class_name 底線字串化做為預設的 form namescope
    model_class_name.underscore.to_sym
  end

  def default_scope
    # 預設狀態下是 Class 本身，可以視情況自行重定義調整
    model_class
  end

  def current_collection
    # 由前面的 default_scope 限制範圍再加上 Kaminari 提供的 page method 做分頁
    @current_collection ||= default_scope.page(params[:page])
  end

  def current_object
    # 用 default_scope 限制搜尋的範圍
    @current_object ||= default_scope.find(params[:id])
  end

  def params_permit
    # 這邊需要在每個繼承後的 controller 內定義 permitted_attributes
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
