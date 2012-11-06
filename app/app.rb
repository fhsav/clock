class Clock < Padrino::Application
  register Padrino::Helpers
  register Padrino::Rendering

  register BaristaInitializer
  register CompassInitializer

  use Faye::RackAdapter, :mount => "/faye", :timeout => 25

  enable :sessions
end
