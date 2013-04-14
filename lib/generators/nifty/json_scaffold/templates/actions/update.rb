  def update
    begin
      @<%= instance_name %> = <%= relation_name %>.find(params[:id])
      @<%= instance_name %>.update_attributes(<%= class_name.underscore %>_params)
      @jsonResult.object = <%= instance_name %>
      @jsonResult.status = true
    rescue Exception => e
      @jsonResult.status = false
      @jsonResult.message = "error"
      throw e if Rails.env != "production"
    end

  end
