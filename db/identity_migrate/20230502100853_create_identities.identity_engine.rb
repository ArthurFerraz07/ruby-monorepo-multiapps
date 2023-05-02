# This migration comes from identity_engine (originally 20230502092506)
class CreateIdentities < ActiveRecord::Migration[7.0]
  def change
    create_table :identities do |t|
      t.string :email
      t.string :encrypted_password

      t.timestamps
    end
  end
end
