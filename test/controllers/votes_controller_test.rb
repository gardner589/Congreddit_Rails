require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vote = votes(:one)
  end

  test "should get index" do
    get votes_url
    assert_response :success
  end

  test "should get new" do
    get new_vote_url
    assert_response :success
  end

  test "should create vote" do
    assert_difference('Vote.count') do
      post votes_url, params: { vote: { bill_id: @vote.bill_id, chamber: @vote.chamber, congress: @vote.congress, result: @vote.result, roll_id: @vote.roll_id, vote_type: @vote.vote_type, voted_at: @vote.voted_at, year: @vote.year } }
    end

    assert_redirected_to vote_url(Vote.last)
  end

  test "should show vote" do
    get vote_url(@vote)
    assert_response :success
  end

  test "should get edit" do
    get edit_vote_url(@vote)
    assert_response :success
  end

  test "should update vote" do
    patch vote_url(@vote), params: { vote: { bill_id: @vote.bill_id, chamber: @vote.chamber, congress: @vote.congress, result: @vote.result, roll_id: @vote.roll_id, vote_type: @vote.vote_type, voted_at: @vote.voted_at, year: @vote.year } }
    assert_redirected_to vote_url(@vote)
  end

  test "should destroy vote" do
    assert_difference('Vote.count', -1) do
      delete vote_url(@vote)
    end

    assert_redirected_to votes_url
  end
end
