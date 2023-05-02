class CreateWithdraws < ActiveRecord::Migration[7.0]
  def change
    create_table :withdraws do |t|
      t.bigint :identity_id, null: false
      t.string :currency, null: false
      t.string :address, null: false
      t.decimal :amount, null: false
      t.string :status, null: false, default: 'pending'

      t.timestamps
    end
  end
end
