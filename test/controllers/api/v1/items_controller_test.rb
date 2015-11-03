require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns the right number of objects" do
    number_of_items = Item.count
    get :index, format: :json

    json_response = JSON.parse(response.body)

    assert_equal number_of_items, json_response.count
  end

  test "#show" do
    item = items(:one)
    get :show, id: item.id, format: :json

    assert_response :success
  end

  test "#show returns the right object name" do
    item = items(:one)
    get :show, id: item.id, format: :json

    json_response = JSON.parse(response.body)

    assert_equal json_response["name"], "AWonderfulVase"
  end

  test "#create a new item" do
    new_item = { name: "Cool item pizza", description: "yummy" }
    post :create, format: :json, item: new_item

    assert_response :created
  end
end
