require 'digest/sha1'

Clock.helpers do
  
  # Encrypts the string with SHA1.
  def encrypt(str)
    Digest::SHA1.hexdigest(str)
  end

  # Returns a BCrypt::Password object (for passwords).
  def bcrypt(str)
    BCrypt::Password.create(str)
  end
end