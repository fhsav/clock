class Clock < Padrino::Application
  register Padrino::Helpers
  register Padrino::Rendering

  register BaristaInitializer
  register CompassInitializer

  enable :sessions

  configure :development do
    use BetterErrors::Middleware

    BetterErrors.application_root = PADRINO_ROOT
  end

  Pusher.app_id = ENV["PUSHER_ID"]
  Pusher.key = ENV["PUSHER_KEY"]
  Pusher.secret = ENV["PUSHER_SECRET"]
end
