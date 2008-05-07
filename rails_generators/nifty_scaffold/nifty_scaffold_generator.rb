class NiftyScaffoldGenerator < Rails::Generator::Base
  attr_accessor :name, :attributes, :controller_actions
  
  def initialize(runtime_args, runtime_options = {})
    super
    usage if @args.empty?
    
    @name = @args.first
    @controller_actions = []
    @attributes = []
    
    @args[1..-1].each do |arg|
      if arg.include? ':'
        @attributes << Rails::Generator::GeneratedAttribute.new(*arg.split(":"))
      else
        @controller_actions << arg
      end
    end
  end

  def manifest
    record do |m|
      m.directory "app/controllers"
      m.directory "app/models"
      m.directory "app/views/#{plural_name}"
      m.template "controller.rb", "app/controllers/#{plural_name}_controller.rb"
      m.template "model.rb", "app/models/#{singular_name}.rb"
      
      controller_actions.each do |action|
        if File.exist? source_path("views/#{action}.html.erb")
          m.template "views/#{action}.html.erb", "app/views/#{plural_name}/#{action}.html.erb"
        end
      end
      
      if form_partial?
        m.template "views/_form.html.erb", "app/views/#{plural_name}/_form.html.erb"
      end
    end
  end
  
  def form_partial?
    controller_actions.include?('new') && controller_actions.include?('edit')
  end
  
  def singular_name
    name.underscore
  end
  
  def plural_name
    name.pluralize
  end
  
  def class_name
    name.camelize
  end
  
  def plural_class_name
    plural_name.camelize
  end
  
  def controller_methods
    controller_actions.map do |action|
      controller_method(action)
    end.join
  end
  
  def controller_method(name)
    read_template("actions/#{name}.rb")
  end
  
  def render_form
    if form_partial?
      "<%= render :partial => 'form' %>"
    else
      read_template("views/_form.html.erb")
    end
  end
  
  def item_path
    if controller_actions.include? 'show'
      "@#{singular_name}"
    else
      "#{plural_name}_path"
    end
  end
  
protected
  
  def read_template(relative_path)
    ERB.new(File.read(source_path(relative_path)), nil, '-').result(binding)
  end
  
  def banner
    <<-EOS
Creates a controller and model given the name and attributes.

USAGE: #{$0} #{spec.name} name
EOS
  end
end