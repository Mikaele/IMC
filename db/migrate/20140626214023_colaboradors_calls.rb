class ColaboradorsCalls < ActiveRecord::Migration
  def self.up
    create_table 'colaboradors_calls' do |t|
      t.column :colaborador_id, :integer
      t.column :service_id_id, :integer
      t.timestamps

    end
  end
end
