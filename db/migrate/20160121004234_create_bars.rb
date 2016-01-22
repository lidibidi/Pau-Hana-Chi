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
  end
end
