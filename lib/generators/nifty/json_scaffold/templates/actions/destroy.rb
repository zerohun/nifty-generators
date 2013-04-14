  def destroy
    begin
      <%= instance_name %> = <%= relation_name %>.find(params[:id])
      <%= instance_name %>.destroy
      render :json => {:status => true, :message => "success"}
    rescue Exception => e
      render :json => {:status => false, :message => "error"}
      throw e if Rails.env != "production"
    end
  end
