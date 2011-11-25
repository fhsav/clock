module BaristaInitializer
  def self.registered(app)
    Barista.configure do |c|
      c.root = File.join(Padrino.root, "app", "assets", "coffee")
      c.output_root = File.join(Padrino.root, "public", "jsc")
      c.verbose = false
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
