class AddStatusToProject < ActiveRecord::Migration
  def change
    add_column :projects, :status, :string
    add_column :projects, :description, :text
  end
end
