# frozen_string_literal: true

module BaseApi::Users
  def self.new_user(params)
    user = User.new(first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    begin
      user.save!
    rescue ActiveRecord::RecordInvalid => e
      ServiceContract.error("Error saving user.")
    end

    ServiceContract.success(user)
  end

  def self.destroy_user(user_id)
    user = User.find(user_id)
    return ServiceContract.error("Error destroying user.") unless user.destroy

    ServiceContract.success(user)
  end
end