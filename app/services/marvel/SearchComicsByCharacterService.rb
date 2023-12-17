module Marvel
  class SearchComicsByCharacterService < BaseService
    def call(search_term)
      character_id = Marvel::FetchCharacterIdService.new.call(character: search_term)
      
      query_params = {
        'ts' => TIMESTAMP,
        'apikey' => ENV['MARVEL_PUBLIC_KEY'],
        'hash' => HASH,
        'characters' => character_id,
        'orderBy' => '-onsaleDate',
        'limit' => 100,
        'offset' => Comic.where("? = ANY(characters)", search_term).count
      }

      response = fetch('/comics', query_params)
      binding.pry
      save(response)
    end
  end
end