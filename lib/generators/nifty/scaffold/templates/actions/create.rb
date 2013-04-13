  def create
    @<%= instance_name %> = <%= relation_name %>.new(<%= class_name.underscore %>_params)
    if @<%= instance_name %>.save
      redirect_to <%= item_url %>, :notice => "Successfully created <%= class_name.underscore.humanize.downcase %>."
    else
      render :new
    end
  end
