class ChangeAlbumYearType < ActiveRecord::Migration
  def change
    change_column :albums, :year, :string
  end
end
