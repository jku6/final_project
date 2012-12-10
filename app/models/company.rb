class Company < ActiveRecord::Base
  attr_accessible :name, :lat, :long, :address, :address2, :category, :url, :hiring
  has_many :ratings

end