class PagesController < ApplicationController

  def index
    @publications = Publication.all
  end

  def account
    @publications = current_user.publications.all
  end

  end
