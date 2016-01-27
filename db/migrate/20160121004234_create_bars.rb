class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :bar_name
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :neighborhood
      t.string :phone
      t.string :website

      t.timestamps null: false
    end
    add_index :bars, [:user_id, :created_at]
  end
end
