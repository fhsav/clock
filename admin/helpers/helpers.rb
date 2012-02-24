require 'digest/sha1'

Admin.helpers do
  def local(time)
    if ENV["HEROKU"]
      time.strftime("%k:%M").to_s.strip
    else
      TZ.utc_to_local(time).strftime("%k:%M").to_s.strip
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
  
  def time?(string)
    string.to_s.match(/^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$/)
  end
  
  def entities(string)
  	he = HTMLEntities.new
  	he.decode(string)
  end
end
