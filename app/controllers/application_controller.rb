class ApplicationController < ActionController::Base
<<<<<<< Updated upstream
=======
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:last_name,:first_name,:last_name_kana,:first_name_kana,:user_birthday,:postal_code,:prefecture_id,:city,:address,:buliding_name,:tel])
  end
>>>>>>> Stashed changes
end
