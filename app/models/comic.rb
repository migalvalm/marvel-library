class Comic < ApplicationRecord
  # The Marvel Comics API does not provide full paths to images. 
  # Instead, images are represented as a partial path to an image file and the canonical extension of that file.
  # We have to select from a set of image variants (predefined sizes and ratios)
  def cover
    cover_url + '/portrait_incredible.jpg'
  end
end