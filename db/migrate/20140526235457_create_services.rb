class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.integer :number
      t.string :category
      t.string :description
      t.references :ic, index: true

      t.timestamps
    end
  end
end
