require 'bcrypt'

module PasswordAttribute

  def password
    BCrypt::Password.new(password_before_type_cast)
  end

  def password=(plain_text)
    self.password = BCrypt::Password.create(plain_text)
  end

end
