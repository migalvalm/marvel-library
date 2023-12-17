# spec/services/marvel/fetch_comics_service_spec.rb

require 'rails_helper'

RSpec.describe Marvel::FetchComicsService do
  let(:service) { described_class.new }

  describe '#call' do
    it 'creates comics' do
      allow(Net::HTTP).to receive(:get).and_return('{"data": {"results": [{"title": "Comic Title", "thumbnail": {"path": "http://example.com/cover.jpg"}, "characters": {"items": [{"name": "Character 1"}]}, "dates": [{"date": "2023-01-01"}]}]}}')

      expect { service.call }.to change { Comic.count }.by(1)
    end
  end
end
