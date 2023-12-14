class ComicsController < ApplicationController
  def index
   @comics = Comic.order(created_at: :desc)
  end
 
  def search
  end
 
  def favorite
  end
 end
 