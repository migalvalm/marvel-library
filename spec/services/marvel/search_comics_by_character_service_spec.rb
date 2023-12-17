# spec/services/marvel/search_comics_by_character_service_spec.rb

require 'rails_helper'

RSpec.describe Marvel::SearchComicsByCharacterService do
  let(:service) { described_class.new }
  let(:search_term) { 'Character 1' }
  let(:character_id) { '1' }
  let(:response) { { 'data' => { 'results' => [{'title' => 'Comic Title', 'thumbnail' => {'path' => 'http://example.com/cover.jpg'}, 'characters' => {'items' => [{'name' => 'Character 1'}]}, 'dates' => [{'date' => '2023-01-01'}]}] } } }

  before do
    allow(Marvel::FetchCharacterIdService).to receive(:new).and_return(double(call: character_id))
    allow(service).to receive(:fetch).and_return(response)
    allow(service).to receive(:save)
  end

  describe '#call' do
    it 'calls FetchCharacterIdService with the correct search term' do
      service.call(search_term)
      expect(Marvel::FetchCharacterIdService).to have_received(:new).with(no_args)
      expect(Marvel::FetchCharacterIdService.new).to have_received(:call).with(character: search_term)
    end

    it 'calls fetch with the correct parameters' do
      service.call(search_term)
      expect(service).to have_received(:fetch).with('/comics', hash_including('characters' => character_id))
    end

    it 'calls save with the correct response' do
      service.call(search_term)
      expect(service).to have_received(:save).with(response)
    end
  end
end
