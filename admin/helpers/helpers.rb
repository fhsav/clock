require 'digest/sha1'

Admin.helpers do
  def local(time)
    time = time - 14400
    time.strftime("%I:%M%P")
  end
  
  def authenticate!
    session["fhsclock"] ||= 0
    session["fhsclock"] = options.session_secret
    
    redirect url(:index)
  end
  
  def deauthenticate!
    session["fhsclock"] ||= 0
    
    redirect url(:login)
  end
  
  def authenticated?
    unless session["fhsclock"] == options.session_secret
      redirect url(:login)
    end
  end
  
  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end
end
