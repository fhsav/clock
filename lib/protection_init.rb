module ProtectionInitializer
  def self.registered(app)
    app.use Rack::Protection
  end
end
