class CreatePlacesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :places_users, id: false do |t|
    	t.integer :place_id
    	t.integer :user_id
    end
  end
end
