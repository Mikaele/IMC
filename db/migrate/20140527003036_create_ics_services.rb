class CreateIcsServices < ActiveRecord::Migration
  def change
    create_table :ics_services do |t|
      t.references :ic, index: true
      t.references :service, index: true

      t.timestamps
    end
  end
end
