class Backends::ImagesController < BackendsController

  skip_before_action :verify_authenticity_token

  def ck_upload
    @image = Image.create(file: params[:upload])

    # render :text=>u.obj_tmp.url
    render  :text=> "<script>window.parent.CKEDITOR.tools.callFunction(#{params[:CKEditorFuncNum]},\"#{@image.file.url}\")</script>"
    return
  end  
  
end
