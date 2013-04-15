  def show
    @error_message = "error"

    <%= instance_name %> = <%= relation_name %>.find(params[:id])
    @jsonResult.object = <%= instance_name %>
  end
