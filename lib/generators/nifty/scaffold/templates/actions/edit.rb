  def edit
    @<%= instance_name %> = <%= relation_name %>.find(params[:id])
  end
