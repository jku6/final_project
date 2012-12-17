# == Schema Information
#
# Table name: companies
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  lat            :float
#  long           :float
#  address        :string(255)
#  address2       :string(255)
#  category       :string(255)
#  url            :string(255)
#  hiring         :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  rating_average :decimal(6, 2)    default(0.0)
#

class Company < ActiveRecord::Base
  attr_accessible :name, :lat, :long, :address, :address2, :category, :url, :hiring
  letsrate_rateable "overall_satisfaction", "satisfaction_with_staff_resources", "quality_of_work", "fulfillment_of_project_objectives", "adherence_to_project_deadlines", "responsiveness_to_requests_questions", "price_value"

  has_many :mycomments
  
  def self.text_search(query)
      self.where("name @@ :q or address @@ :q or category @@ :q or url @@ :q", :q => query)
  end

end
