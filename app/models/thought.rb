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
  
  attr_accessible :title, :author, :blurb, :content, :tag_list
  
  [:title, :blurb, :content, :author].each do |field| 
    validates field, presence: true
  end
    
  has_many :comments, as: :commentable, dependent: :destroy
  
  # external plugins
  
  paginates_per 25
  
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  acts_as_taggable
  
  def display_time
    updated_at.strftime "%b %-d, %Y"
  end
  
end
