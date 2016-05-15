class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text
      t.string :provider
      t.string :nickname
      t.references :identity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
