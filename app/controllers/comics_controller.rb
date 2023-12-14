class ComicsController < ApplicationController
  def index
    @comics = Comic.page(page).order(published_at: :desc)

    if @comics.total_pages == page.to_i
      Marvel.fetch_comics
      @comics = Comic.page(page).order(published_at: :desc)
    end
  end
 
  def search
  end
 
  def favorite
  end

  private

  def page
    params[:page]
  end
 end
 