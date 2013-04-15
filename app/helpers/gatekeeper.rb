Clock::Web.helpers do

  # Check if authenticated or not.
  def authenticated?
    unless PADRINO_ENV == "test" or !password?
      session_key == session["clock"]
    end
  end

  # Redirect the user appropriately.
  def redirect!
    unless PADRINO_ENV == "test"
      if !password?
        flash[:warning] = "Please set a password before continuing."
        redirect url(:settings, :new)
      end

      unless authenticated?
        flash[:warning] = "Y'all need to give me your password first."
        redirect url(:sessions, :new)
      end
    end
  end

  # Check if there has been a password set (is this the initial run?).
  def password?
    !Redis.get("password").blank?
  end

  # Generate the session key for a particular password.
  def session_key
    encrypt(Redis.get("password") + encrypt(settings.session_secret))
  end
end
