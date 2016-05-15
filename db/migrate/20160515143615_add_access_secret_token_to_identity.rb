class AddAccessSecretTokenToIdentity < ActiveRecord::Migration
  def change
    add_column :identities, :access_secret_token, :string
  end
end
