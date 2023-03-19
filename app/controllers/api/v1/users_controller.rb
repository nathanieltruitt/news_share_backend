# handles API endpoints to users
class Api::V1::UsersController < Api::V1::ApplicationController
  skip_before_action :authenticate, only: %i[login create]

  before_action :ensure_user_params, only: :create

  def login
    result = BaseApi::Auth.login(params[:email], params[:password], @ip)
    render_error(errors: "User not authenticated", status: 401) and return unless result.success?

    payload = {
      user: UserBlueprint.render_as_hash(result.payload[:user], view: :login),
      token: TokenBlueprint.render_as_hash(result.payload[:token]),
      status: 200
    }
    render_success(payload:)
  end

  def logout
    result = BaseApi::Auth.logout(@current_user, @token)
    render_error(errors: "There was a problem logging out", status: 400) and return unless result.success?

    render_success(payload: "You have been logged out", status: 200)
  end

  def create
    result = BaseApi::Users.new_user(params)
    render_error(errors: "There was a problem creating a new user", status: 400) and return unless result.success?

    payload = {
      user: UserBlueprint.render_as_hash(result.payload, view: :normal)
    }

    render_success(payload:, status: 201)
  end

  def me
    render_success(payload: UserBlueprint.render_as_hash(@current_user), status: 200)
  end

  private

  def ensure_user_params
    required_params = %i[first_name last_name email password password_confirmation]
    ensure_required_params(required_params, params)
  end
end
