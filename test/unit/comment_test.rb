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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  setup do
    fields = {
      commentable_id: 1, 
      commentable_type: "Thought",
      facebook_uid: 'aj.ostrow',
      content: 'cool insight!'
    }
    @comment = Comment.new fields
  end
  
  test "create a comment" do
    assert @comment.save
  end
  
  test "comment must have a parent" do 
    #the type and id go together for polymorphic relationship
    
    @comment.commentable_id = nil
    assert !@comment.save
  end
  
  test "comment must have a facebook user id" do
    @comment.facebook_uid = nil
    assert !@comment.save
  end
  
  test "comment must have some content" do
    @comment.content = ''
    assert !@comment.save
  end
  
end
