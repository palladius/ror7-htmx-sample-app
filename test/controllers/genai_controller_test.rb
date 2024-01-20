require "test_helper"

class GenaiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get genai_index_url
    assert_response :success
  end

  test "should get show" do
    get genai_show_url
    assert_response :success
  end

  test "should get click" do
    get genai_click_url
    assert_response :success
  end

  test "should get unclick" do
    get genai_unclick_url
    assert_response :success
  end

  test "should get sobenme" do
    get genai_sobenme_url
    assert_response :success
  end

  test "should get why_sky_blue" do
    get genai_why_sky_blue_url
    assert_response :success
  end
end
