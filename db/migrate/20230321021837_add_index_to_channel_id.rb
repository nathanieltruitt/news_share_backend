class AddIndexToChannelId < ActiveRecord::Migration[7.0]
  def change
    add_index :channels, :yt_channel_id
  end
end
