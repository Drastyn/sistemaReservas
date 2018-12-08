require 'test_helper'

class HabitacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get habitaciones" do
    get habitaciones_habitaciones_url
    assert_response :success
  end

end
