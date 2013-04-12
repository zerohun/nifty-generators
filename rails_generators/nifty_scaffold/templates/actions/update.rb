  def update
    @<%= singular_name %> = <%= class_name %>.find(params[:id])
    if @<%= singular_name %>.update_attributes(<%= singular_name %>_params)
      flash[:notice] = "Successfully updated <%= name.underscore.humanize.downcase %>."
      redirect_to <%= item_path('url') %>
    else
      render :action => 'edit'
    end
  end
