module BaristaInitializer
  def self.registered(app)
    Barista.configure do |c|
      c.root = File.join(Padrino.root, "app", "assets", "jsc")
      c.output_root = File.join(Padrino.root, "public", "jsc")

      c.on_compilation do |file|
        File.open(path, 'w'){|f| f.write(JSMin.minify(File.read(file)))}
      end
    end

    app.register Barista::Integration::Sinatra
  end
end

# Shut Barista up.
module Barista
  class << self
    def logger
      @logger = nil
    end
  end
end
