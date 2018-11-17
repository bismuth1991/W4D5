class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string  :body, null: false
      t.boolean :public, default: true, null: false
      t.boolean :completed, default: false, null: false

      t.timestamps
    end

    add_index :goals, :user_id
  end
end
