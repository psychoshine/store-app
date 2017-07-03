require 'test_helper'

class ContactInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_info = contact_infos(:one)
  end

  test "should get index" do
    get contact_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_info_url
    assert_response :success
  end

  test "should create contact_info" do
    assert_difference('ContactInfo.count') do
      post contact_infos_url, params: { contact_info: { adress: @contact_info.adress, email: @contact_info.email, phone: @contact_info.phone, state: @contact_info.state, user_id: @contact_info.user_id, zip_code: @contact_info.zip_code } }
    end

    assert_redirected_to contact_info_url(ContactInfo.last)
  end

  test "should show contact_info" do
    get contact_info_url(@contact_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_info_url(@contact_info)
    assert_response :success
  end

  test "should update contact_info" do
    patch contact_info_url(@contact_info), params: { contact_info: { adress: @contact_info.adress, email: @contact_info.email, phone: @contact_info.phone, state: @contact_info.state, user_id: @contact_info.user_id, zip_code: @contact_info.zip_code } }
    assert_redirected_to contact_info_url(@contact_info)
  end

  test "should destroy contact_info" do
    assert_difference('ContactInfo.count', -1) do
      delete contact_info_url(@contact_info)
    end

    assert_redirected_to contact_infos_url
  end
end
