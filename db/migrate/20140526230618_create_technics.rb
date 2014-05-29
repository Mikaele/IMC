class CreateTechnics < ActiveRecord::Migration
  def change
    create_table :technics do |t|
      t.references :user, index: true
      t.integer :level

      t.timestamps
    end
  end
end
