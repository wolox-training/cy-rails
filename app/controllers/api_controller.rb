class ApiController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate
  include Pundit
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index; end

  def not_found
    render json: { error: 'record not found' }, status: :not_found
  end

  def set_locale
    I18n.locale = current_user.locale
  end

  private

  def user_not_authorized
    policy_name = exception.policy.class.to_s.underscore
    message = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
    render json: { error: message }, status: :forbidden
  end
end
