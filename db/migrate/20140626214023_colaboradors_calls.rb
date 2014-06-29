class ColaboradorsCalls < ActiveRecord::Migration
  def self.up
    create_table 'colaboradors_calls' do |t|
      t.column :colaborador_id, :integer
      t.column :call_id, :integer
      t.timestamps

    end
  end
end
