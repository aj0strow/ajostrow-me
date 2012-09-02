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
  
  setup do
    fields = {
      title: 'Title', 
      blurb: 'Blurb', 
      content: 'content, content', 
      author: 'aj.ostrow'
    }
    @thought = Thought.new fields
  end
    
  test 'create a thought' do
    assert @thought.save
  end
  
  test 'thought must have title' do
    @thought.title = nil
    assert !@thought.save
    
    @thought.title = ''
    assert !@thought.save
  end
  
  test 'thought must have blurb' do
    @thought.blurb = ''
    assert !@thought.save
  end
  
  test 'thought must have content' do
    @thought.content = ''
    assert !@thought.save
  end
  
  test 'thought must have author' do
    @thought.author = ''
    assert !@thought.save
  end

end
