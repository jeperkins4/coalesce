class AddLocationToProject < ActiveRecord::Migration
  def change
    add_column :projects, :location, :string
    add_column :projects, :city, :string
    add_column :projects, :state, :string, limit: 40
    add_column :projects, :country, :string, limit: 40
    add_column :projects, :postal_code, :string, limit: 20
    add_column :projects, :latitude, :decimal
    add_column :projects, :longitude, :decimal
    add_column :projects, :hashtag, :string
  end
end
