class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :genre
      t.integer :band_members
      t.string :image_url

      t.timestamps
    end
  end
end
