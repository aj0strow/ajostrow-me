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

class Thought < ActiveRecord::Base
  
  attr_accessible :author, :blurb, :content, :title, :tag_list
  
  validates :blurb, presence: true
  validates :content, presence: true
  validates :title, presence: true
  
  acts_as_taggable
  
  def display_time
    updated_at.strftime "%b %-d, %Y"
  end
  
end
