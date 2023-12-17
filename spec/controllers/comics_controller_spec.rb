require 'rails_helper'

RSpec.describe ComicsController, type: :controller do
  describe "GET #index" do
    before do
      search_service = double
      fetch_service = double

      allow(fetch_service).to receive(:call).with(any_args)
      allow(Marvel::FetchComicsService).to receive(:new).with(no_args).and_return(fetch_service)

      allow(search_service).to receive(:call).with(any_args)
      allow(Marvel::SearchComicsByCharacterService).to receive(:new).and_return(search_service)
      
      @comic = FactoryBot.create(:comic)
    end
   

    it "returns the comics in the database" do
      get :index
      expect(assigns(:comics)).to include(@comic)
    end

    it "calls SearchComicsByCharacterService if search_term is present" do
      get :index, params: { page: '1', search_term: 'Iron Man'}
      expect(Marvel::SearchComicsByCharacterService).to have_received(:new)
      expect(Marvel::SearchComicsByCharacterService.new).to have_received(:call).with('Iron Man')
    end

    it "fetches more comics when the user is at the last page" do
      get :index, params: { page: '1' }
      expect(Marvel::FetchComicsService).to have_received(:new)
      expect(Marvel::FetchComicsService.new).to have_received(:call).with(no_args)
    end
  end
end