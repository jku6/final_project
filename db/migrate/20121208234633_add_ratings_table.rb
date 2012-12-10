class AddRatingsTable < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.float :rating
      t.integer :company_id
      t.timestamps
    end
  end
end
