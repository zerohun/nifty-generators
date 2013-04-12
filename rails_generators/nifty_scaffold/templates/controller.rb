class <%= plural_class_name %>Controller < ApplicationController
  <%= controller_methods :actions %>

  private
  def <%= class_name %>_params
    params.require(:<%= class_name %>).permit(<%= attributes.map { |a| ":#{a.name}" }.join(", ") %>)
  end

end
