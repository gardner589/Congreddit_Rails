require 'test_helper'

class BillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill = bills(:one)
  end

  test "should get index" do
    get bills_url
    assert_response :success
  end

  test "should get new" do
    get new_bill_url
    assert_response :success
  end

  test "should create bill" do
    assert_difference('Bill.count') do
      post bills_url, params: { bill: { bill_id: @bill.bill_id, bill_type: @bill.bill_type, chamber: @bill.chamber, committees: @bill.committees, congress: @bill.congress, history: @bill.history, introduced: @bill.introduced, last_action: @bill.last_action, last_version: @bill.last_version, last_vote: @bill.last_vote, official_title: @bill.official_title, popular_title: @bill.popular_title, short_title: @bill.short_title, sponsor: @bill.sponsor, sponsor_bio_id: @bill.sponsor_bio_id } }
    end

    assert_redirected_to bill_url(Bill.last)
  end

  test "should show bill" do
    get bill_url(@bill)
    assert_response :success
  end

  test "should get edit" do
    get edit_bill_url(@bill)
    assert_response :success
  end

  test "should update bill" do
    patch bill_url(@bill), params: { bill: { bill_id: @bill.bill_id, bill_type: @bill.bill_type, chamber: @bill.chamber, committees: @bill.committees, congress: @bill.congress, history: @bill.history, introduced: @bill.introduced, last_action: @bill.last_action, last_version: @bill.last_version, last_vote: @bill.last_vote, official_title: @bill.official_title, popular_title: @bill.popular_title, short_title: @bill.short_title, sponsor: @bill.sponsor, sponsor_bio_id: @bill.sponsor_bio_id } }
    assert_redirected_to bill_url(@bill)
  end

  test "should destroy bill" do
    assert_difference('Bill.count', -1) do
      delete bill_url(@bill)
    end

    assert_redirected_to bills_url
  end
end
