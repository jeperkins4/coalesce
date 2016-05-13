class AddMediaMetaToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :file_size, :integer
    add_column :documents, :content_type, :string
  end
end
