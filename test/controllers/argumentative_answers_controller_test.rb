require 'test_helper'

class ArgumentativeAnswersControllerTest < ActionController::TestCase
  setup do
    @argumentative_answer = argumentative_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:argumentative_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create argumentative_answer" do
    assert_difference('ArgumentativeAnswer.count') do
      post :create, argumentative_answer: {  }
    end

    assert_redirected_to argumentative_answer_path(assigns(:argumentative_answer))
  end

  test "should show argumentative_answer" do
    get :show, id: @argumentative_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @argumentative_answer
    assert_response :success
  end

  test "should update argumentative_answer" do
    patch :update, id: @argumentative_answer, argumentative_answer: {  }
    assert_redirected_to argumentative_answer_path(assigns(:argumentative_answer))
  end

  test "should destroy argumentative_answer" do
    assert_difference('ArgumentativeAnswer.count', -1) do
      delete :destroy, id: @argumentative_answer
    end

    assert_redirected_to argumentative_answers_path
  end
end
