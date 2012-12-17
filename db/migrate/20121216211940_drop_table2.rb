class DropTable2 < ActiveRecord::Migration
  def change
    drop_table :active_admin_comments
    drop_table :admin_users
   
    drop_table :favorites
    drop_table :friendings
    drop_table :reputation_actions
    drop_table :reputations
    drop_table :votes
  end
end
