class PasswordResetsController < ApplicationController
  before_action :get_utilisateur, only: [:edit, :update]
  before_action :valid_utilisateur, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end
  
  def create
    @utilisateur = Utilisateur.find_by(email: params[:password_reset][:email].downcase)
    if @utilisateur
      @utilisateur.create_reset_digest
      @utilisateur.send_password_reset_email
      flash[:info] = "Un e-mail a été envoyé avec les instructions pour récupérer votre mot de passe."
      redirect_to root_url
    else
      flash.now[:danger] = "Adresse e-mail non trouvée"
      render 'new'
    end
  end

  def update
    if params[:utilisateur][:password].empty?
      @utilisateur.errors.add(:password, "ne peut pas être vide.")
      render 'edit'
    elsif @utilisateur.update_attributes(utilisateur_params)
      log_in @utilisateur
      flash[:success] = "Le mot de passe a été mis à jour"
      redirect_to @utilisateur
    else
      render 'edit'
    end
  end

  def edit
  end

  private

  def utilisateur_params
    params.require(:utilisateur).permit(:password, :password_confirmation)
  end

  def get_utilisateur
    @utilisateur = Utilisateur.find_by(email: params[:email])
  end

  def valid_utilisateur
    unless @utilisateur && @utilisateur.activated? && @utilisateur.authenticated?(:reset, params[:id])
      redirect_to root_url
    end
  end

  def check_expiration
    if @utilisateur.password_reset_expired?
      flash[:danger] = "le lien a expiré"
      redirect_to new_password_reset_url
    end
  end
end