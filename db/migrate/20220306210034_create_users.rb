class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_enum :user_role, ["user", "admin"]
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :organization_id
      t.string :password_digest
      t.enum :role, enum_type: "user_role", default: "user", null: false

      t.timestamps
    end
  end
end
