require 'test_helper'

class MainShotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_shot = main_shots(:one)
  end

  test "should get index" do
    get main_shots_url
    assert_response :success
  end

  test "should get new" do
    get new_main_shot_url
    assert_response :success
  end

  test "should create main_shot" do
    assert_difference('MainShot.count') do
      post main_shots_url, params: { main_shot: { description: @main_shot.description, title: @main_shot.title } }
    end

    assert_redirected_to main_shot_url(MainShot.last)
  end

  test "should show main_shot" do
    get main_shot_url(@main_shot)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_shot_url(@main_shot)
    assert_response :success
  end

  test "should update main_shot" do
    patch main_shot_url(@main_shot), params: { main_shot: { description: @main_shot.description, title: @main_shot.title } }
    assert_redirected_to main_shot_url(@main_shot)
  end

  test "should destroy main_shot" do
    assert_difference('MainShot.count', -1) do
      delete main_shot_url(@main_shot)
    end

    assert_redirected_to main_shots_url
  end
end
