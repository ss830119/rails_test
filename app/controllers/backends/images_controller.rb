class Backends::ImagesController < BackendsController

  skip_before_action :verify_authenticity_token

  def ck_upload
    @image = Image.create(file: params[:upload])

    respond_to do |format|
      format.js {

      }
      format.html {
        render layout: false, plain: %Q(<html><body><script type="text/javascript">window.parent.CKEDITOR.tools.callFunction('#{params[:CKEditorFuncNum]}', "#{@image.file.url}\");</script></body></html>)
      }
    end  

  end
