require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car = cars(:one)
  end

  test "should get index" do
    get cars_url
    assert_response :success
  end

  test "should get new" do
    get new_car_url
    assert_response :success
  end

  test "should create car" do
    assert_difference('Car.count') do
      post cars_url, params: { car: { make_id: @car.make_id, model: @car.model, vin: @car.vin } }
    end

    assert_redirected_to car_url(Car.last)
  end

  test "should show car" do
    get car_url(@car)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_url(@car)
    assert_response :success
  end

  test "should update car" do
    patch car_url(@car), params: { car: { make_id: @car.make_id, model: @car.model, vin: @car.vin } }
    assert_redirected_to car_url(@car)
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete car_url(@car)
    end

    assert_redirected_to cars_url
  end

  test "should find cars from the fixture" do
    assert Car.where("model like ?", "Corolla").length == 1
  end

  test name "should not find cars from the fixture" do
    assert Car.where("model like ?", "Nothere").length == 0
  end

  test "searches always return 200" do
    get search_cars_url, params: { search: "Corolla"}
    assert_equal 200, status
  end

end
