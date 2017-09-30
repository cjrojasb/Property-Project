class PagesController < ApplicationController

  #load_and_authorize_resource class:PagesController

  def index
    @publications = Publication.all
  end

  def account
    @publications = current_user.publications.all
  end

 end
