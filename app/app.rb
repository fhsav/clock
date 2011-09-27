class Clock < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register CompassInitializer
  register BaristaInitializer
  
  layout :application
end
