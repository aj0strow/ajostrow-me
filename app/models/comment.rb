# == Schema Information
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  commentable_id   :integer
#  commentable_type :string(255)
#  facebook_uid     :string(255)
#  content          :text
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :content, :facebook_uid
    
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

end
