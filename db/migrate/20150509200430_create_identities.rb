class CreateIdentities < ActiveRecord::Migration
    def change
      create_table :identities do |t|
        t.string :uid
        t.string :provider
        t.references :user
        #oauth stuff (token and expiration)
        t.string :oauth_token
        t.datetime :oauth_expires_at
        t.string :image
      end

      add_index :identities, :user_id
    end
end
