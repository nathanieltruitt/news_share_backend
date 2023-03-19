class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :content_url, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :thumbnail_url, null: false
      t.integer :thumbnail_width, null: false
      t.integer :thumbnail_height, null: false
      t.datetime :published_at, null: false
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :channel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
