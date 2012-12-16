class CreateMycomments < ActiveRecord::Migration
  def change
    create_table :mycomments do |t|
      t.integer :user_id
      t.string :text
      t.integer :company_id

      t.timestamps
    end
  end
end
