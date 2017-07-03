require 'test_helper'

class SelectedItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @selected_item = selected_items(:one)
  end

  test "should get index" do
    get selected_items_url
    assert_response :success
  end

  test "should get new" do
    get new_selected_item_url
    assert_response :success
  end

  test "should create selected_item" do
    assert_difference('SelectedItem.count') do
      post selected_items_url, params: { selected_item: { quantity: @selected_item.quantity, shop_item_id: @selected_item.shop_item_id } }
    end

    assert_redirected_to selected_item_url(SelectedItem.last)
  end

  test "should show selected_item" do
    get selected_item_url(@selected_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_selected_item_url(@selected_item)
    assert_response :success
  end

  test "should update selected_item" do
    patch selected_item_url(@selected_item), params: { selected_item: { quantity: @selected_item.quantity, shop_item_id: @selected_item.shop_item_id } }
    assert_redirected_to selected_item_url(@selected_item)
  end

  test "should destroy selected_item" do
    assert_difference('SelectedItem.count', -1) do
      delete selected_item_url(@selected_item)
    end

    assert_redirected_to selected_items_url
  end
end
