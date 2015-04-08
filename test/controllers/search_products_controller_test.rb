require 'test_helper'

class SearchProductsControllerTest < ActionController::TestCase
  setup do
    @search_product = search_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_product" do
    assert_difference('SearchProduct.count') do
      post :create, search_product: { product_details: @search_product.product_details, product_discount: @search_product.product_discount, product_id: @search_product.product_id, product_image: @search_product.product_image, product_link: @search_product.product_link, product_price: @search_product.product_price, product_site: @search_product.product_site, product_title: @search_product.product_title }
    end

    assert_redirected_to search_product_path(assigns(:search_product))
  end

  test "should show search_product" do
    get :show, id: @search_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search_product
    assert_response :success
  end

  test "should update search_product" do
    patch :update, id: @search_product, search_product: { product_details: @search_product.product_details, product_discount: @search_product.product_discount, product_id: @search_product.product_id, product_image: @search_product.product_image, product_link: @search_product.product_link, product_price: @search_product.product_price, product_site: @search_product.product_site, product_title: @search_product.product_title }
    assert_redirected_to search_product_path(assigns(:search_product))
  end

  test "should destroy search_product" do
    assert_difference('SearchProduct.count', -1) do
      delete :destroy, id: @search_product
    end

    assert_redirected_to search_products_path
  end
end
