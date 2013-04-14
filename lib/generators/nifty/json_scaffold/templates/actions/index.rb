  def index
    begin
      <%= instances_name %> = <%= relation_name %>
      @jsonResult.object = <%= instances_name %>
      @jsonResult.status = true
    rescue Exception => e
      @jsonResult.status = false
      @jsonResult.message = "error"
      throw e if Rails.env != "production"
    end
  end
