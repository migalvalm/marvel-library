module Marvel
  class FetchCharacterIdService < BaseService
    def call(character: nil)
      query_params = {
        'ts' => TIMESTAMP,
        'apikey' => ENV['MARVEL_PUBLIC_KEY'],
        'hash' => HASH,
        'name' => character
      }

      response = fetch('/characters', query_params)
      
      return '' if (response['data'].blank? || response['data']['results'].blank?)
      response['data']['results'].first['id'].to_s
    end
  end
end