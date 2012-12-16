class DropTables < ActiveRecord::Migration
  def change
    # drop_table active_admin_comments
    # drop_table admin_users
    drop_table :comments
    # favorites
    # friendings
    # reputation_actions
    # reputations
    # votes
  end
end
