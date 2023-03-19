class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :yt_channel_id

      t.timestamps
    end
  end
end
