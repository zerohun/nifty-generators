  def index
    @<%= instances_name %> = <%= relation_name %>.all
  end
