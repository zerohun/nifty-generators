  def create
    @error_message = "error"

    <%= instance_name %> = <%= relation_name %>.new(<%= class_name.underscore %>_params)
    <%= instance_name %>.save
    @jsonResult.object = <%= instance_name %>
  end
