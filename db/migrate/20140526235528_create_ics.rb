class CreateIcs < ActiveRecord::Migration
  def change
    create_table :ics do |t|
      t.string :name
      t.integer :number
      t.string :description

      t.timestamps
    end
  end
end
