class UtilisateursController < ApplicationController
  before_action :logged_in_utilisateur, only: [:edit, :update, :destroy]
  before_action :correct_utilisateur, only: [:edit, :update]
  before_action :admin_utilisateur, only: :destroy
  def show
    @utilisateur = Utilisateur.find(params[:id])
    @microposts = @utilisateur.microposts.paginate(page: params[:page])
  end

  def index
    @utilisateurs = Utilisateur.paginate(page: params[:page])
  end

  def new
    @utilisateur = Utilisateur.new
  end

  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save
    @utilisateur.send_activation_email
    flash[:info] = "Merci de consulter votre e-mail pour le lien d'activation de votre compte."
    redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @utilisateur = Utilisateur.find(params[:id])
  end

  def update
    @utilisateur = Utilisateur.find(params[:id])
    if @utilisateur.update_attributes(utilisateur_params)
      flash[:success] = 'Profil updated'
      redirect_to @utilisateur
    else
      render 'edit'
    end
  end

  def destroy
    Utilisateur.find(params[:id]).destroy
    flash[:success] = "Utilisateur supprime"
    redirect_to utilisateurs_url
  end

  private
  
  def utilisateur_params
    params.require(:utilisateur).permit(:nom, :email, :password, :password_confirmation)
  end

  def correct_utilisateur
    @utilisateur = Utilisateur.find(params[:id])
    redirect_to(root_url) unless current_utilisateur?(@utilisateur)
  end

  def admin_utilisateur
    redirect_to(root_url) unless current_utilisateur.admin?
  end
end