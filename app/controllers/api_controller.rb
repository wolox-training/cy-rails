class ApiController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index; end

  def not_found
    render json: { error: 'record not found' }, status: :not_found
  end

  def set_locale
    I18n.locale = current_api_v1_user.locale
  end
end