class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.belongs_to :from_airport, class_name: "Airport"
      t.belongs_to :to_airport, class_name: "Airport"
      t.datetime :start
      t.float :duration

      t.timestamps
    end
  end
end
