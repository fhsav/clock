class Clock < Padrino::Application
  register ProtectionInitializer
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
end
