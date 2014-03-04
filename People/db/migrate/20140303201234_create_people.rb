class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, limit: 50
      t.integer :age

      t.timestamps
    end
  end
end
