  def index
    @error_message = "error"

    <%= instances_name %> = <%= relation_name %>
    @jsonResult.object = <%= instances_name %>
  end
