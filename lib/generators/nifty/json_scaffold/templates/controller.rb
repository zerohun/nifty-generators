class <%= plural_class_name %>Controller < ApplicationController
  <%= controller_methods :actions %>
  private
  def <%= class_name.underscore %>_params
    params.require(:<%= class_name.underscore %>).permit(<%= model_attributes.map { |a| ":#{a.name}" }.join(", ") %>)
  end
end
