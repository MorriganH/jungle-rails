class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates :password, length: {minimum: 5}
  before_save :downcase_email
  
  def self.authenticate_with_credentials(email, password)
    @user = self.find_by_email(email)
    
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

  private

  def downcase_email
    self.email.downcase!
  end
end