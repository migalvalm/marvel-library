class ComicsController < ApplicationController
  before_action :fetch_comics, only: [:index]

  def index
    comics
  end

  private

  def fetch_comics
    # If the current page is the same amount as the total pages that the Comics (with the current filters) are divided into
    if comics.total_pages == page.to_i
      if search_term.present?
        Marvel::SearchComicsByCharacterService.new.call(search_term)
      else
        Marvel::FetchComicsService.new.call
      end
    end
  end

  def comics
    @comics = if search_term.blank?
      Comic.page(page).order(published_at: :desc)
    else
      Comic.where("? = ANY(characters)", search_term).page(page).order(published_at: :desc)
    end
  end

  def search_term
    permitted_params[:search_term] || nil
  end

  def page
    permitted_params[:page]
  end

  def permitted_params
    params.permit(:page, :search_term)
  end
 end
 