require 'net/http'
require 'uri'
require 'json'
require 'digest'

module Marvel
  class BaseService
    include ActiveSupport::Concern

    TIMESTAMP = Time.now.to_i * 1000
    INPUT = "#{TIMESTAMP}#{ENV['MARVEL_PRIVATE_KEY']}#{ENV['MARVEL_PUBLIC_KEY']}"
    HASH = Digest::MD5.hexdigest(INPUT)

    def fetch(endpoint, query_params)
      query_params['ts'] = TIMESTAMP
      query_params['apikey'] = ENV['MARVEL_PUBLIC_KEY']
      query_params['hash'] = HASH

      uri = URI(ENV['MARVEL_API_URL'] + endpoint)
      uri.query = URI.encode_www_form(query_params)
      response = JSON.parse(Net::HTTP.get(uri))
      return response
    end

    def save(response)
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
  end
end