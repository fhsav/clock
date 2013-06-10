Clock::Web.helpers do

  # Check to see if the user is logged in.
  def authenticated?
    Ohm.redis.get('password') == session['clock']
  end

  # Authenticate the user.
  def authenticate!
    session['clock'] = Ohm.redis.get('password')
  end

  # Deauthenticate the user.
  def deauthenticate!
    session['clock'] = 0
  end

  # Check to see if the user put in the right password.
  def valid_password?(password)
    Ohm.redis.get('password') == encrypt(password)
  end

  # Redirect to new password page if there isn't a password set.
  #   If there is a password set and the user isn't authenticated,
  #   redirect to the login page.
  def redirect!
    if !password?
      flash[:warning] = 'Please set a password before continuing.'
      redirect url(:settings, :new)
    end

    unless authenticated?
      flash[:warning] = "Y'all need to give me your password first."
      redirect url(:sessions, :new)
    end
  end

  # See if a password is set.
  def password?
    !Ohm.redis.get('password').blank?
  end
end
