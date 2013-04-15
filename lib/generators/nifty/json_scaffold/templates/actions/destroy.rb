  def destroy
    @error_message = "error"

    <%= instance_name %> = <%= relation_name %>.find(params[:id])
    <%= instance_name %>.destroy
    render :json => {:status => true, :message => "success"}
  end
