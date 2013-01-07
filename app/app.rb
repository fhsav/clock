class Clock < Padrino::Application
  register Padrino::Helpers
  register Padrino::Rendering

  register BaristaInitializer
  register CompassInitializer

  enable :sessions
end
