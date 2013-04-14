json.status @jsonResult.status
json.message @jsonResult.message

if @jsonResult.object.present?
  <%= instances_name %> = @jsonResult.object
  json.<%= instances_name %> <%= instances_name %> do |json, <%= instance_name %>|
    json.(<%= instance_name %>, <%= model_attributes.map { |a| ":#{a.name}" }.join(", ") %>)
  end
end
