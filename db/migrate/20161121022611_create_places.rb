class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.integer :day
      t.string :month
      t.integer :year
      t.string :time_to
      t.string :time_from
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
