class MicropostsController < ApplicationController
  before_action :logged_in_utilisateur, only: [:create, :destroy]
  before_action :correct_utilisateur, only: :destroy

  def create
    @micropost = current_utilisateur.microposts.build(micropost_params)
    if @micropost.save 
      flash[:success] = "Le tweet a été crée !"
      redirect_to root_url
    else
      @feed_items = []
      render 'statique/accueil'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Tweet supprimé"
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_utilisateur
   @micropost = current_utilisateur.microposts.find_by(id: params[:id])
   redirect_to root_url if @micropost.nil?
  end  
end