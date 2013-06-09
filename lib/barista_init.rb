module BaristaInitializer
  def self.registered(app)
    Barista.configure do |c|
      c.root = Padrino.root('app/assets/jsc')
      c.output_root = Padrino.root('public/jsc')
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
