module BaristaInitializer
  def self.registered(app)
    Barista.configure do |c|
      c.root = File.join(Padrino.root, "app", "assets", "coffee")
      c.output_root = File.join(Padrino.root, "public", "jsc")
    end

    app.register Barista::Integration::Sinatra
  end
end
