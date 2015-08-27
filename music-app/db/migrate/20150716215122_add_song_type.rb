class AddSongType < ActiveRecord::Migration
  def change
    add_column :tracks, :song_type, :string
  end
end
