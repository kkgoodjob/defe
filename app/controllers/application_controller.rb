class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?

  private
  
  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :l_name_kanji, :f_name_kanji, :l_name_kana, :f_name_kana, :birthday, :postal_code, :prefecture_id, :municipality, :town, :chome, :phone_number, :attribute_id])
  end
end
