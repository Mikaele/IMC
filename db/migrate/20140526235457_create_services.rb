class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.integer :number
      t.references :category
      t.string :description
      t.references :ic, index: true
      t.time :tempo

      t.timestamps
    end
  end
end
