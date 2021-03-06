class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :name
      t.string :password_digest
      t.timestamp null:false
    end
  end
end
