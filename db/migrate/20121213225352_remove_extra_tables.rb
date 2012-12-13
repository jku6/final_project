class RemoveExtraTables < ActiveRecord::Migration
  def change
    drop_table :rates
    drop_table :ratings
  end
end
