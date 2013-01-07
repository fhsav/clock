class Clock < Padrino::Application
  register Padrino::Helpers
  register Padrino::Rendering

  register BaristaInitializer
  register CompassInitializer

  enable :sessions

  Pusher.app_id = ENV["PUSHER_ID"]
  Pusher.key = ENV["PUSHER_KEY"]
  Pusher.secret = ENV["PUSHER_SECRET"]
end
