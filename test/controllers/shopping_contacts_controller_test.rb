require 'test_helper'

class ShoppingContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopping_contact = shopping_contacts(:one)
  end

  test "should get index" do
    get shopping_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_shopping_contact_url
    assert_response :success
  end

  test "should create shopping_contact" do
    assert_difference('ShoppingContact.count') do
      post shopping_contacts_url, params: { shopping_contact: { adress: @shopping_contact.adress, email: @shopping_contact.email, phone: @shopping_contact.phone, shopping_cart_id: @shopping_contact.shopping_cart_id, state: @shopping_contact.state, user_id: @shopping_contact.user_id, zip_code: @shopping_contact.zip_code } }
    end

    assert_redirected_to shopping_contact_url(ShoppingContact.last)
  end

  test "should show shopping_contact" do
    get shopping_contact_url(@shopping_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_shopping_contact_url(@shopping_contact)
    assert_response :success
  end

  test "should update shopping_contact" do
    patch shopping_contact_url(@shopping_contact), params: { shopping_contact: { adress: @shopping_contact.adress, email: @shopping_contact.email, phone: @shopping_contact.phone, shopping_cart_id: @shopping_contact.shopping_cart_id, state: @shopping_contact.state, user_id: @shopping_contact.user_id, zip_code: @shopping_contact.zip_code } }
    assert_redirected_to shopping_contact_url(@shopping_contact)
  end

  test "should destroy shopping_contact" do
    assert_difference('ShoppingContact.count', -1) do
      delete shopping_contact_url(@shopping_contact)
    end

    assert_redirected_to shopping_contacts_url
  end
end
