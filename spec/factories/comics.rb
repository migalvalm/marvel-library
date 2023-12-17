FactoryBot.define do
  factory :comic do
    title { "Comic Title" }
    cover_url { "http://example.com/cover.jpg" }
    characters { ["Character 1", "Character 2"] }
    published_at { DateTime.now }
  end
 end