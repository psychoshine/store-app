require 'test_helper'

class ShoppingCartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopping_cart = shopping_carts(:one)
  end

  test "should get index" do
    get shopping_carts_url
    assert_response :success
  end

  test "should get new" do
    get new_shopping_cart_url
    assert_response :success
  end

  test "should create shopping_cart" do
    assert_difference('ShoppingCart.count') do
      post shopping_carts_url, params: { shopping_cart: { contact_info_id: @shopping_cart.contact_info_id, selected_item_ids: @shopping_cart.selected_item_ids, shop_item_ids: @shopping_cart.shop_item_ids, user_id: @shopping_cart.user_id } }
    end

    assert_redirected_to shopping_cart_url(ShoppingCart.last)
  end

  test "should show shopping_cart" do
    get shopping_cart_url(@shopping_cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_shopping_cart_url(@shopping_cart)
    assert_response :success
  end

  test "should update shopping_cart" do
    patch shopping_cart_url(@shopping_cart), params: { shopping_cart: { contact_info_id: @shopping_cart.contact_info_id, selected_item_ids: @shopping_cart.selected_item_ids, shop_item_ids: @shopping_cart.shop_item_ids, user_id: @shopping_cart.user_id } }
    assert_redirected_to shopping_cart_url(@shopping_cart)
  end

  test "should destroy shopping_cart" do
    assert_difference('ShoppingCart.count', -1) do
      delete shopping_cart_url(@shopping_cart)
    end

    assert_redirected_to shopping_carts_url
  end
end
