# == Schema Information
#
# Table name: projects
#
#  id          :integer         not null, primary key
#  finished_at :datetime
#  name        :string(255)
#  blurb       :string(255)
#  description :text
#  project_url :string(255)
#  code_url    :string(255)
#  language    :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
