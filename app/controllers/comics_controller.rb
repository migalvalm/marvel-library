class ComicsController < ApplicationController
  def index
    # Checks if user is at the last page
    if comics.total_pages == page.to_i
      if search_term.present?
        search_comics_by_search_term
      else
        fetch_most_recent_comics
      end

      # Reload the comics to include the newly fetched ones
      comics
    end
  end
 
  def search
    search_comics_by_search_term if search_term.present?
  end

  private

  def fetch_comics_by_search_term
    Marvel.search_comics_by_character(
      character_id: Marvel.fetch_character_id(character: search_term),
      character_name: search_term
    )
  end

  def fetch_most_recent_comics
    Marvel.fetch_comics
  end

  def comics
    @comics = if search_term.blank?
      Comic.page(page).order(published_at: :desc)
    else
      Comic.where("? = ANY(characters)", search_term).page(page).order(published_at: :desc)
    end
  end

  def search_term
    permitted_params[:search] || nil
  end

  def page
    permitted_params[:page] == 'search' ? 1 : permitted_params[:page]
  end

  def permitted_params
    params.permit(:page, :search, :comic_id)
  end
 end
 