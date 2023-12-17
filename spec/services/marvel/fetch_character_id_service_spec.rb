# spec/services/marvel/fetch_character_id_service_spec.rb

require 'rails_helper'

RSpec.describe Marvel::FetchCharacterIdService do
  let(:service) { described_class.new }

  describe '#call' do
    it 'returns a character id' do
      allow(Net::HTTP).to receive(:get).and_return('{"data": {"results": [{"id": 1}]}}')

      character_id = service.call(character: 'Character 1')
      expect(character_id).to eq('1')
    end
  end
end
