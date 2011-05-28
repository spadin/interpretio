require 'test_helper'

class TranslationControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get begin" do
    get :begin
    assert_response :success
  end

end
