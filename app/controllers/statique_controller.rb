class StatiqueController < ApplicationController
 
  def accueil
    if logged_in?
    @micropost = current_utilisateur.microposts.build if logged_in?
    @feed_items = current_utilisateur.feed.paginate(page: params[:page])
    end
  end

  def contact
  end

  def team
  end

  def services
  end

end
