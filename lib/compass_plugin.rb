module CompassInitializer
  def self.registered(app)
    require 'sass/plugin/rack'

    Compass.configuration do |config|
      config.project_path = Padrino.root
      config.sass_dir = "app/assets/css"
      config.project_type = :stand_alone
      config.http_path = "/"
      config.css_dir = "public/css"
      config.images_dir = "public/img"
      config.javascripts_dir = "public/jsc"
      config.output_style = :compressed
    end

    Sass::Plugin.options[:never_update] = true if Padrino.env == :production

    Compass.configure_sass_plugin!
    Compass.handle_configuration_change!

    app.use Sass::Plugin::Rack
  end
end
