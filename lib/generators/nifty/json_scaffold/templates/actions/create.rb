  def create
    begin
      <%= instance_name %> = <%= relation_name %>.new(<%= class_name.underscore %>_params)
      <%= instance_name %>.save
      @jsonResult.object = <%= instance_name %>
      @jsonResult.status = true
    rescue Exception => e
      @jsonResult.status = false
      @jsonResult.message = "error"
      throw e if Rails.env != "production"
    end
  end
