class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.references :technic, index: true
      t.references :client, index: true
      t.integer :number
      t.string :state
      t.integer :time_worked

      t.timestamps
    end
  end
end
