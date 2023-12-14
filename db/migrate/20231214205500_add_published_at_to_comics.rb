class AddPublishedAtToComics < ActiveRecord::Migration[7.1]
  def change
    add_column :comics, :published_at, :datetime
  end
end
