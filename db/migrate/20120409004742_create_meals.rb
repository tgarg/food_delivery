class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.decimal :price, :scale => 2

      t.timestamps
    end
  end
end
