require 'test_helper'

class NosotrosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nosotros_index_url
    assert_response :success
  end

end
