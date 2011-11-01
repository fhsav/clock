module CompassInitializer
  def self.registered(app)
    require 'sass/plugin/rack'

    Compass.configuration do |config|
      config.project_path = Padrino.root
      config.sass_dir = File.join(PADRINO_ROOT, "app", "assets", "compass")
      config.project_type = :stand_alone
      config.http_path = "/"
      config.css_dir = File.join(PADRINO_ROOT, "public", "css")
      config.images_dir = File.join(PADRINO_ROOT, "public", "img")
      config.javascripts_dir = File.join(PADRINO_ROOT, "public", "jsc")
      config.output_style = :compressed
    end

    Compass.configure_sass_plugin!
    Compass.handle_configuration_change!

    app.use Sass::Plugin::Rack
  end
end
