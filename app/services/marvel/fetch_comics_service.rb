module Marvel
  class FetchComicsService < BaseService
    def call
      query_params = {
        'ts' => TIMESTAMP,
        'apikey' => ENV['MARVEL_PUBLIC_KEY'],
        'hash' => HASH,
        'orderBy' => '-onsaleDate',
        'limit' => 100,
        'offset' => Comic.count
      }  

      response = fetch('/comics', query_params)
      save(response)
    end
  end
end