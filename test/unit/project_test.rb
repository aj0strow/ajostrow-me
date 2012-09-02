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
  
  def setup
    fields = {
      finished_at: Time.now.to_datetime, 
      name: 'Cool project', 
      blurb: 'Cool blurb', 
      description: 'cool description in markdown', 
      project_url: 'http://www.google.com/', 
      code_url: 'http://www.yahoo.com/',
      language: 'code stuff'
    }
    @project = Project.new fields
  end
  
  test "create a project" do
    assert @project.save
  end
  
  test "project must have a finished_at date" do
    @project.send :write_attribute, :finished_at, nil
    assert !@project.save
  end
  
  test "project must have a name" do
    @project.name = ''
    assert !@project.save
  end
  
  test "project must have blurb" do
    @project.blurb = ''
    assert !@project.save
  end
  
  test "project must have description" do
    @project.description = ''
    assert !@project.save
  end
  
  test "project must have project url" do
    @project.project_url = 'random string'
    assert !@project.save
    @project.project_url = nil
    assert !@project.save
  end
  
  test "project must have valid or no code url" do
    @project.code_url = 'random string'
    assert !@project.save
    @project.code_url = nil
    assert @project.save
  end

  test "descript must be under 10,000 characters" do
    @project.description = 'a' * 10_001
    assert !@project.save
    @project.description = nil
    assert !@project.save
  end

end
