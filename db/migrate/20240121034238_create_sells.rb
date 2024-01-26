class CreateSells < ActiveRecord::Migration[7.0]
  def change
    create_table :sells do |t|
      t.references :user, null: false, foreign_key: true
      t.string :item, null: false
      t.text :memo
      t.integer :status_id, null: false
      t.integer :price
      t.integer :wish
      t.date :limit, null: false
      t.timestamps
    end
  end
end
