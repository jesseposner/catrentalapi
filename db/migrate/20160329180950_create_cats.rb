class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, limit: 1, null: false
      t.text :description, null:false
      t.integer :age

      t.timestamps null: false
    end

    add_index :cats, :name
    add_index :cats, :sex
    add_index :cats, :color
    add_index :cats, :birth_date
    add_index :cats, :age
  end
end
