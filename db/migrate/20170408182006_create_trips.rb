class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|

      t.belongs_to :passenger
      t.belongs_to :driver

      t.string :date
      t.integer :rating
      t.decimal :fare

      t.timestamps
    end
  end
end
