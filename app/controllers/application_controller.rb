class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def logged_in_utilisateur
    unless logged_in?
      store_location
      flash[:danger] = 'Merci de vous connecter'
      redirect_to login_url
    end
  end
   
end
