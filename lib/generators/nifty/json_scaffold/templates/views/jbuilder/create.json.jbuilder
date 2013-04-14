json.status @jsonResult.status
json.message @jsonResult.message

if @jsonResult.object.present?
  <%= instance_name %> = @jsonResult.object
  json.<%= instance_name %> do |json|
    json.(<%= instance_name %>, <%= model_attributes.map { |a| ":#{a.name}" }.join(", ") %>)
  end
end


