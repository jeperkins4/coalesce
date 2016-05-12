class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :projects_teams, id: false, force: :cascade do |t|
      t.integer :project_id
      t.integer :team_id
      t.index [:project_id, :team_id], name: 'idx_projects_teams_project_id_team_id', using: :btree
    end

    create_table :teams_users, id: false, force: :cascade do |t|
      t.integer :user_id
      t.integer :team_id
      t.index [:user_id, :team_id], name: 'idx_users_teams_user_id_team_id', using: :btree
    end
  end
end
