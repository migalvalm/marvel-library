class CreateComics < ActiveRecord::Migration[7.1]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :cover_url
      t.string :characters, array: true, default: []

      t.timestamps
    end
  end
end
