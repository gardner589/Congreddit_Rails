require 'test_helper'

class LegislatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legislator = legislators(:one)
  end

  test "should get index" do
    get legislators_url
    assert_response :success
  end

  test "should get new" do
    get new_legislator_url
    assert_response :success
  end

  test "should create legislator" do
    assert_difference('Legislator.count') do
      post legislators_url, params: { legislator: { integer: @legislator.integer, name: @legislator.name, party: @legislator.party } }
    end

    assert_redirected_to legislator_url(Legislator.last)
  end

  test "should show legislator" do
    get legislator_url(@legislator)
    assert_response :success
  end

  test "should get edit" do
    get edit_legislator_url(@legislator)
    assert_response :success
  end

  test "should update legislator" do
    patch legislator_url(@legislator), params: { legislator: { integer: @legislator.integer, name: @legislator.name, party: @legislator.party } }
    assert_redirected_to legislator_url(@legislator)
  end

  test "should destroy legislator" do
    assert_difference('Legislator.count', -1) do
      delete legislator_url(@legislator)
    end

    assert_redirected_to legislators_url
  end
end
