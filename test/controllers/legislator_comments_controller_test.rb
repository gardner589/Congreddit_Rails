require 'test_helper'

class LegislatorCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legislator_comment = legislator_comments(:one)
  end

  test "should get index" do
    get legislator_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_legislator_comment_url
    assert_response :success
  end

  test "should create legislator_comment" do
    assert_difference('LegislatorComment.count') do
      post legislator_comments_url, params: { legislator_comment: { author: @legislator_comment.author, content: @legislator_comment.content } }
    end

    assert_redirected_to legislator_comment_url(LegislatorComment.last)
  end

  test "should show legislator_comment" do
    get legislator_comment_url(@legislator_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_legislator_comment_url(@legislator_comment)
    assert_response :success
  end

  test "should update legislator_comment" do
    patch legislator_comment_url(@legislator_comment), params: { legislator_comment: { author: @legislator_comment.author, content: @legislator_comment.content } }
    assert_redirected_to legislator_comment_url(@legislator_comment)
  end

  test "should destroy legislator_comment" do
    assert_difference('LegislatorComment.count', -1) do
      delete legislator_comment_url(@legislator_comment)
    end

    assert_redirected_to legislator_comments_url
  end
end
