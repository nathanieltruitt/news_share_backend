# frozen_string_literal: true

# used for authenticating the user and logging out the user. Also used for clearing tokens.
module BaseApi::Auth
  def self.login(email, password, ip)
    user = User.find_by(email:).try(:authenticate, password)

    return ServiceContract.error("User not found.") if user.nil?

    return ServiceContract.error("Password is incorrect.") unless user

    token = user.generate_token!(ip)
    ServiceContract.success({ user:, token: })
  end

  def self.logout(user, token)
    return ServiceContract.success(true) if user && token.update(revocation_date: DateTime.now)

    ServiceContract.error("Error logging out user.")
  end

  def self.clear_other_tokens
    ServiceContract.error("Error revoking past logins.") and return unless user

    Token.where(user_id: user.id).where.not(value: token).update(revocation_date: DateTime.now)
    ServiceContact.success(true)
  end
end