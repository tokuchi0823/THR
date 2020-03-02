require 'test_helper'

class SankasControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sankas_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sankas_destroy_url
    assert_response :success
  end

end
