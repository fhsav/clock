Clock::Web.helpers do

  # Check to see if the user is logged in.
  def authenticated?
    Ohm.redis.call('GET', 'password') == session['clock'];
  end

  # Authenticate the user.
  def authenticate!
    session['clock'] = Ohm.redis.call('GET', 'password')
  end

  # Deauthenticate the user.
  def deauthenticate!
    session['clock'] = 0
  end

  # Check to see if the user put in the right password.
  def valid_password?(password)
    Ohm.redis.call('GET', 'password') == encrypt(password)
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
    !Ohm.redis.call('GET', 'password').blank?
  end
end
