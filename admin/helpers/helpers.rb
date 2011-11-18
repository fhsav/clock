require 'digest/sha1'

Admin.helpers do
  def local(time)
  	if time != nil
      time = time - 14400
	    time.strftime("%k:%M")
    end
  end
  
  def authenticate!
    session["fhsclock"] ||= 0
    session["fhsclock"] = settings.session_secret
    
    redirect url(:index)
  end
  
  def deauthenticate!
    session["fhsclock"] ||= 0
    
    redirect url(:login)
  end
  
  def authenticated?
    unless session["fhsclock"] == settings.session_secret
      redirect url(:login)
    end
  end
  
  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end
end
