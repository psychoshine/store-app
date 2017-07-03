require 'test_helper'

class PostSlidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_slide = post_slides(:one)
  end

  test "should get index" do
    get post_slides_url
    assert_response :success
  end

  test "should get new" do
    get new_post_slide_url
    assert_response :success
  end

  test "should create post_slide" do
    assert_difference('PostSlide.count') do
      post post_slides_url, params: { post_slide: { description: @post_slide.description } }
    end

    assert_redirected_to post_slide_url(PostSlide.last)
  end

  test "should show post_slide" do
    get post_slide_url(@post_slide)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_slide_url(@post_slide)
    assert_response :success
  end

  test "should update post_slide" do
    patch post_slide_url(@post_slide), params: { post_slide: { description: @post_slide.description } }
    assert_redirected_to post_slide_url(@post_slide)
  end

  test "should destroy post_slide" do
    assert_difference('PostSlide.count', -1) do
      delete post_slide_url(@post_slide)
    end

    assert_redirected_to post_slides_url
  end
end
