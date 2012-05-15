require 'test_helper'

class PythonRunnerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
