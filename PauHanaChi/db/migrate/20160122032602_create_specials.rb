class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.string :day
      t.string :special_description
      t.string :special_price
      t.time :start_time
      t.time :end_time
      t.integer :bar_id

      t.timestamps null: false
    end
  end
end
