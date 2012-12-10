class AddCompaniesTable < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :address
      t.string :address2
      t.string :category
      t.string :url
      t.boolean :hiring
      t.timestamps
    end
  end
end
