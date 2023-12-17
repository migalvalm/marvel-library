# spec/models/comic_spec.rb

require 'rails_helper'

RSpec.describe Comic, type: :model do
  it "is valid with valid attributes" do
    comic = Comic.new(
      title: "Comic Title",
      cover_url: "http://example.com/cover.jpg",
      characters: ["Character 1", "Character 2"],
      published_at: DateTime.now
    )
    expect(comic).to be_valid
  end

  it "is valid without a title" do
    comic = Comic.new(
      cover_url: "http://example.com/cover.jpg",
      characters: ["Character 1", "Character 2"],
      published_at: DateTime.now
    )
    expect(comic).to be_valid
  end

  it "is valid without a cover_url" do
    comic = Comic.new(
      title: "Comic Title",
      characters: ["Character 1", "Character 2"],
      published_at: DateTime.now
    )
    expect(comic).to be_valid
  end

  it "is valid without characters" do
    comic = Comic.new(
      title: "Comic Title",
      cover_url: "http://example.com/cover.jpg",
      published_at: DateTime.now
    )
    expect(comic).to be_valid
  end

  it "is valid without a published_at date" do
    comic = Comic.new(
      title: "Comic Title",
      cover_url: "http://example.com/cover.jpg",
      characters: ["Character 1", "Character 2"]
    )
    expect(comic).to be_valid
  end

  it "returns the correct cover URL" do
    comic = Comic.new(
      title: "Comic Title",
      cover_url: "http://example.com/cover.jpg",
      characters: ["Character 1", "Character 2"],
      published_at: DateTime.now
    )
    expect(comic.cover).to eq("http://example.com/cover.jpg/portrait_uncanny.jpg")
  end
end
