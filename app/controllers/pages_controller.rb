class PagesController < ApplicationController

  def index
    @publications = Publication.all
  end

  def account
    @publications = Publication.all
    @categories = Category.all
    @types = Type.all
    @communes = Commune.all
    @regions = Region.all
  end

  end
