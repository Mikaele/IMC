class CreateCallsServices < ActiveRecord::Migration
  def change
    create_table :calls_services do |t|
      t.references :call, index: true
      t.references :service, index: true
    end
  end
end
