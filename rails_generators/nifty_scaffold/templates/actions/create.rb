  def create
    @<%= singular_name %> = <%= class_name %>.new(<%= singular_name %>_params)
    if @<%= singular_name %>.save
      flash[:notice] = "Successfully created <%= name.underscore.humanize.downcase %>."
      redirect_to <%= item_path('url') %>
    else
      render :action => 'new'
    end
  end
