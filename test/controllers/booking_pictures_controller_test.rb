require 'test_helper'

class BookingPicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_picture = booking_pictures(:one)
  end

  test "should get index" do
    get booking_pictures_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_picture_url
    assert_response :success
  end

  test "should create booking_picture" do
    assert_difference('BookingPicture.count') do
      post booking_pictures_url, params: { booking_picture: { booking_post_id: @booking_picture.booking_post_id } }
    end

    assert_redirected_to booking_picture_url(BookingPicture.last)
  end

  test "should show booking_picture" do
    get booking_picture_url(@booking_picture)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_picture_url(@booking_picture)
    assert_response :success
  end

  test "should update booking_picture" do
    patch booking_picture_url(@booking_picture), params: { booking_picture: { booking_post_id: @booking_picture.booking_post_id } }
    assert_redirected_to booking_picture_url(@booking_picture)
  end

  test "should destroy booking_picture" do
    assert_difference('BookingPicture.count', -1) do
      delete booking_picture_url(@booking_picture)
    end

    assert_redirected_to booking_pictures_url
  end
end
