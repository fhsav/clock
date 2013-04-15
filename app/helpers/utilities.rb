require 'digest/sha1'

Clock::Web.helpers do

  # Encrypts the string with SHA1.
  def encrypt(str)
    Digest::SHA1.hexdigest(str)
  end

  # Returns a BCrypt::Password object (for passwords).
  def bcrypt(str)
    BCrypt::Password.create(str)
  end

  # Make a string HTML safe.
  def safe(str)
    str.html_safe
  end
end
