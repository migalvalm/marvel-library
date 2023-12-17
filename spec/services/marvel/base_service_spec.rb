# spec/services/marvel/base_service_spec.rb

require 'rails_helper'

RSpec.describe Marvel::BaseService do
  let(:service) { described_class.new }

  describe '#fetch' do
    it 'returns a response' do
      allow(Net::HTTP).to receive(:get).and_return('{"data": {}}')

      response = service.fetch('/comics', {})
      expect(response).to be_a(Hash)
    end
  end

  describe '#save' do
    it 'creates a comic' do
      allow(Net::HTTP).to receive(:get).and_return(
        '{"data": 
          {"results": 
            [
              {
                "title": "Comic Title", 
                "thumbnail": {"path": "http://example.com/cover.jpg"}, 
                "characters": {"items": [{"name": "Character 1"}]}, 
                "dates": [{"date": "2023-01-01"}]
              }
            ]
          }
        }'
      )

      response = service.fetch('/comics', {})
      expect { service.save(response) }.to change { Comic.count }.by(1)
    end
  end
end
