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

require 'test_helper'

class MycommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
