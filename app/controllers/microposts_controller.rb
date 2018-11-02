class MicropostsController < ApplicationController
  before_action :logged_in_utilisateur, only: [:create, :destroy]

  def create
  
  end

  def destroy
    
  end

end
