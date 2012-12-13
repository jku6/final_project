class Company < ActiveRecord::Base
  attr_accessible :name, :lat, :long, :address, :address2, :category, :url, :hiring
  letsrate_rateable "speed", "performance", "price", "customer_service"
  def self.text_search(query)
      self.where("name @@ :q or address @@ :q or category @@ :q or url @@ :q", :q => query)
  end

end