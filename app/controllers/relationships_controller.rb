class RelationshipsController < ApplicationController
  before_action :logged_in_utilisateur

  def create
    utilisateur = Utilisateur.find(params[:followed_id])
    current_utilisateur.follow(utilisateur)
    redirect_to root_path
  end

  def destroy
    utilisateur = Relationship.find(params[:id]).followed
    current_utilisateur.unfollow(utilisateur)
    redirect_to root_path
  end
end
