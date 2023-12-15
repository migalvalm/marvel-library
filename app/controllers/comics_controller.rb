class ComicsController < ApplicationController
  def index
    # Checks if user is at the last page
    if comics.total_pages == page.to_i
      # Fetch more 100 comics
      Marvel.fetch_comics if search_term.blank?

      # Search for more 100 comics
      search_comics_by_search_term if search_term.present?

      # Reload the comics to include the newly fetched ones
      comics
    end
  end
 
  def search
    search_comics_by_search_term if search_term.present?
  end
 
  def favorite
  end

  private

  def comics
    @comics ||= if search_term.blank?
      Comic.page(page).order(published_at: :desc)
    else
      Comic.where("? = ANY(characters)", search_term).page(page).order(published_at: :desc)
    end
  end

  def search_comics_by_search_term
    Marvel.search_comics_by_character(
      character_id: Marvel.fetch_character_id(character: search_term),
      character_name: search_term
    )
  end

  def search_term
    params[:search] || nil
  end

  def page
    params[:page] == "search" ? 1 : params[:page]
  end
 end
 