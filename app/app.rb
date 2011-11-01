class Clock < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register ProtectionInitializer
  register CompassInitializer
  register BaristaInitializer
end
