class Mycomment < ActiveRecord::Base
  attr_accessible :company_id, :text, :user_id

  belongs_to :company
  belongs_to :user
end
