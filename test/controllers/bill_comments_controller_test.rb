require 'test_helper'

class BillCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill_comment = bill_comments(:one)
  end

  test "should get index" do
    get bill_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_bill_comment_url
    assert_response :success
  end

  test "should create bill_comment" do
    assert_difference('BillComment.count') do
      post bill_comments_url, params: { bill_comment: { author: @bill_comment.author, content: @bill_comment.content } }
    end

    assert_redirected_to bill_comment_url(BillComment.last)
  end

  test "should show bill_comment" do
    get bill_comment_url(@bill_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_bill_comment_url(@bill_comment)
    assert_response :success
  end

  test "should update bill_comment" do
    patch bill_comment_url(@bill_comment), params: { bill_comment: { author: @bill_comment.author, content: @bill_comment.content } }
    assert_redirected_to bill_comment_url(@bill_comment)
  end

  test "should destroy bill_comment" do
    assert_difference('BillComment.count', -1) do
      delete bill_comment_url(@bill_comment)
    end

    assert_redirected_to bill_comments_url
  end
end
