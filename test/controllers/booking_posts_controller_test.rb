require 'test_helper'

class BookingPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_post = booking_posts(:one)
  end

  test "should get index" do
    get booking_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_post_url
    assert_response :success
  end

  test "should create booking_post" do
    assert_difference('BookingPost.count') do
      post booking_posts_url, params: { booking_post: { black: @booking_post.black, description: @booking_post.description, title: @booking_post.title } }
    end

    assert_redirected_to booking_post_url(BookingPost.last)
  end

  test "should show booking_post" do
    get booking_post_url(@booking_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_post_url(@booking_post)
    assert_response :success
  end

  test "should update booking_post" do
    patch booking_post_url(@booking_post), params: { booking_post: { black: @booking_post.black, description: @booking_post.description, title: @booking_post.title } }
    assert_redirected_to booking_post_url(@booking_post)
  end

  test "should destroy booking_post" do
    assert_difference('BookingPost.count', -1) do
      delete booking_post_url(@booking_post)
    end

    assert_redirected_to booking_posts_url
  end
end
