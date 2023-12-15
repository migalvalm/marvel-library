require 'digest'

module Marvel
  module Authentication
    extend ActiveSupport::Concern
  
    included do
      TIMESTAMP = Time.now.to_i * 1000
      INPUT = "#{TIMESTAMP}#{ENV['MARVEL_PRIVATE_KEY']}#{ENV['MARVEL_PUBLIC_KEY']}"
      HASH = Digest::MD5.hexdigest(INPUT)
    end
  end
 end
 