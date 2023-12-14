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
require "test_helper"

class ComicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
