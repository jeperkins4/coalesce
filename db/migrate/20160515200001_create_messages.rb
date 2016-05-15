class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :posted_text
      t.string :provider
      t.string :nickname
      t.references :identity, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.datetime :posted_at

      t.timestamps null: false
    end
  end
end
