  def update
    @error_message = "error"
    
    @<%= instance_name %> = <%= relation_name %>.find(params[:id])
    @<%= instance_name %>.update_attributes(<%= class_name.underscore %>_params)
    @jsonResult.object = <%= instance_name %>

  end
