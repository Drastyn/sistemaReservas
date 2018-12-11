require 'test_helper'

class HabitacionControllerTest < ActionDispatch::IntegrationTest
  test "should get habitacion" do
    get habitaciones_habitaciones_url
    assert_response :success
  end

end
