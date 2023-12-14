# == Schema Information
#
# Table name: comics
#
#  id           :bigint           not null, primary key
#  characters   :string           default([]), is an Array
#  cover_url    :string
#  published_at :datetime
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Comic < ApplicationRecord
  self.per_page = 15

  # The Marvel Comics API does not provide full paths to images. 
  # Instead, images are represented as a partial path to an image file and the canonical extension of that file.
  # We have to select from a set of image variants (predefined sizes and ratios)
  def cover
    cover_url + '/portrait_uncanny.jpg'
  end
end
