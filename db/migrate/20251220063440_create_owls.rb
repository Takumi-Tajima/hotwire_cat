class CreateOwls < ActiveRecord::Migration[8.0]
  def change
    create_table :owls do |t|
      t.string :name, null: false
      t.integer :age, null: false

      t.timestamps
    end
  end
end
