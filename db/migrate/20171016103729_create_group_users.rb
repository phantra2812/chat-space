class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.references :users, foreign_key: true, null: false
      t.references :groups, foreign_key: true, null: false
      t.timestamps
    end
  end
end
