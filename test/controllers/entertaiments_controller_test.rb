require 'test_helper'

class EntertaimentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entertaiment = entertaiments(:one)
  end

  test "should get index" do
    get entertaiments_url
    assert_response :success
  end

  test "should get new" do
    get new_entertaiment_url
    assert_response :success
  end

  test "should create entertaiment" do
    assert_difference('Entertaiment.count') do
      post entertaiments_url, params: { entertaiment: { black: @entertaiment.black, description: @entertaiment.description, title: @entertaiment.title } }
    end

    assert_redirected_to entertaiment_url(Entertaiment.last)
  end

  test "should show entertaiment" do
    get entertaiment_url(@entertaiment)
    assert_response :success
  end

  test "should get edit" do
    get edit_entertaiment_url(@entertaiment)
    assert_response :success
  end

  test "should update entertaiment" do
    patch entertaiment_url(@entertaiment), params: { entertaiment: { black: @entertaiment.black, description: @entertaiment.description, title: @entertaiment.title } }
    assert_redirected_to entertaiment_url(@entertaiment)
  end

  test "should destroy entertaiment" do
    assert_difference('Entertaiment.count', -1) do
      delete entertaiment_url(@entertaiment)
    end

    assert_redirected_to entertaiments_url
  end
end
