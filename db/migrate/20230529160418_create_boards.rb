class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :category
      t.text :description
      t.string :title
      t.integer :price_per_day
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
