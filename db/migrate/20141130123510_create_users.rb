class CreateUsers < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome, limit: 50
      t.string :email, limit: 50

      t.timestamps
    end
  end
end
