require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def test_comment_is_invalid_without_input
    #arrange
    comment = Comment.create(input: '')

    #act
    valid = comment.valid?

    #assert
    assert_equal(valid, false)
  end

  def test_comment_is_invalid_without_input
    #arrange
    comment = Comment.create(input: 'Hello')

    #act
    valid = comment.valid?

    #assert
    assert_equal(valid, true)

  end


end
