# Authentication
module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :config_params, if: :devise_controller?
  end

  def config_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

end
