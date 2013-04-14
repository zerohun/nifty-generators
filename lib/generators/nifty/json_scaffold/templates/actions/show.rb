  def show
    begin
      <%= instance_name %> = <%= relation_name %>.find(params[:id])
      @jsonResult.object = <%= instance_name %>
      @jsonResult.status = true
    rescue Exception => e
      @jsonResult.status = false
      @jsonResult.message = "error"
      throw e if Rails.env != "production"
    end
  end
