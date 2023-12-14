require 'net/http'
require 'uri'
require 'json'

module MarvelAPI
  include Authentication
  
  def self.fetch_comics(characters: nil)
    query_params = DEFAULT_PARAMS
    query_params['orderBy'] = '-onsaleDate'
    query_params['characters'] = characters if characters
    query_params['limit'] = 100

    uri = URI(ENV['MARVEL_API_URL'] + '/comics')
    uri.query = URI.encode_www_form(query_params)
    response = Net::HTTP.get(uri)

    comics_data = JSON.parse(response)['data']['results']
    comics_data.each do |comic_data|
      unless Comic.exists?(title: comic_data['title'])
        Comic.create(
          title: comic_data['title'],
          cover_url: comic_data['thumbnail']['path'],
          characters: comic_data.dig('characters', 'items')&.map { |item| item["name"] } || []
        )
      end
    end
  end
end