require 'test_helper'

class ArgumentativeQuestionsControllerTest < ActionController::TestCase
  setup do
    @argumentative_question = argumentative_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:argumentative_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create argumentative_question" do
    assert_difference('ArgumentativeQuestion.count') do
      post :create, argumentative_question: {  }
    end

    assert_redirected_to argumentative_question_path(assigns(:argumentative_question))
  end

  test "should show argumentative_question" do
    get :show, id: @argumentative_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @argumentative_question
    assert_response :success
  end

  test "should update argumentative_question" do
    patch :update, id: @argumentative_question, argumentative_question: {  }
    assert_redirected_to argumentative_question_path(assigns(:argumentative_question))
  end

  test "should destroy argumentative_question" do
    assert_difference('ArgumentativeQuestion.count', -1) do
      delete :destroy, id: @argumentative_question
    end

    assert_redirected_to argumentative_questions_path
  end
end
