class PagesController < ApplicationController
before_action :authenticate_user!, except: [:index]
  #load_and_authorize_resource class:PagesController
  
  def index
    @publications = Publication.all
    @publications = Publication.all.order("created_at DESC").limit(4)
  end

  def account
    @publications = current_user.publications.all
  end

 end
