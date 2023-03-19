class User < ApplicationRecord
  has_secure_password validations: true
  has_many :tokens
  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :email, uniqueness: true

  def generate_token!(ip)
    token = Token.create(value: BaseApi::AccessToken.generate(self), user_id: id,
                         expiry: Datetime.current + 7.days, ip:)
  end
end
