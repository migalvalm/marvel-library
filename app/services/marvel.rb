require 'net/http'
require 'uri'
require 'json'

module Marvel
  include Authentication
  
  def self.fetch_comics
    query_params = {
      'ts' => TIMESTAMP,
      'apikey' => ENV['MARVEL_PUBLIC_KEY'],
      'hash' => HASH,
    }
    query_params['orderBy'] = '-onsaleDate'
    query_params['limit'] = 100
    query_params['offset'] = Comic.count

    uri = URI(ENV['MARVEL_API_URL'] + '/comics')
    uri.query = URI.encode_www_form(query_params)
    response = JSON.parse(Net::HTTP.get(uri))

    return if (response['data'].blank? || response['data']['results'].blank?)

    comics_data = response['data']['results']
    comics_data.each do |comic_data|
      unless Comic.exists?(title: comic_data['title'])
        Comic.create(
          title: comic_data['title'],
          cover_url: comic_data['thumbnail']['path'],
          characters: comic_data.dig('characters', 'items')&.map { |item| item["name"] } || [],
          published_at: comic_data['dates'].first['date']
        )
      end
    end
  end

  def self.search_comics_by_character(character_id: nil, character_name: '')
    query_params = {
      'ts' => TIMESTAMP,
      'apikey' => ENV['MARVEL_PUBLIC_KEY'],
      'hash' => HASH,
    }
    query_params['characters'] = character_id
    query_params['orderBy'] = '-onsaleDate'
    query_params['limit'] = 100
    query_params['offset'] = Comic.where("? = ANY(characters)", character_name).count

    uri = URI(ENV['MARVEL_API_URL'] + '/comics')
    uri.query = URI.encode_www_form(query_params)
    response = JSON.parse(Net::HTTP.get(uri))

    return if (response['data'].blank? || response['data']['results'].blank?)

    comics_data = response['data']['results']
    comics_data.each do |comic_data|
      unless Comic.exists?(title: comic_data['title'])
        Comic.create(
          title: comic_data['title'],
          cover_url: comic_data['thumbnail']['path'],
          characters: comic_data.dig('characters', 'items')&.map { |item| item["name"] } || [],
          published_at: comic_data['dates'].first['date']
        )
      end
    end
  end

  def self.fetch_character_id(character: nil)
    query_params = {
      'ts' => TIMESTAMP,
      'apikey' => ENV['MARVEL_PUBLIC_KEY'],
      'hash' => HASH,
    }
    query_params['name'] = character

    uri = URI(ENV['MARVEL_API_URL'] + "/characters")
    uri.query = URI.encode_www_form(query_params)
    response = JSON.parse(Net::HTTP.get(uri))

    return '' if (response['data'].blank? || response['data']['results'].blank?)

    response['data']['results'].first['id'].to_s
  end
end