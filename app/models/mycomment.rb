# == Schema Information
#
# Table name: mycomments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  text       :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Mycomment < ActiveRecord::Base
  attr_accessible :company_id, :text, :user_id

  belongs_to :company
  belongs_to :user
end
