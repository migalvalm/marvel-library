class ComicsController < ApplicationController
  def index
    @comics = Comic.page(page).order(published_at: :desc)

    # Checks if user is at the last page
    if @comics.total_pages == page.to_i
      # Fetch more 100 comics
      Marvel.fetch_comics
      # Reload the comics to include the newly fetched ones
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
 