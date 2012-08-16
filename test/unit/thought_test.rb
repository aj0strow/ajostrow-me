# == Schema Information
#
# Table name: thoughts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  blurb      :string(255)
#  content    :text
#  author     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class ThoughtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
