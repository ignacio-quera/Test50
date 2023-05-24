require 'test_helper'
require 'simplecov'
SimpleCov.start

class AnswersControllerTest < ActionController::TestCase
  setup do
    @answer_one = answers(:one)
    @answer_two = answers(:two)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    # Realiza aserciones adicionales según tus requerimientos
  end
  
  test "should create answer" do
    assert_difference('Answer.count') do
      post :create, params: { answer: { question: @answer_one.question, content: @answer_one.content } }
    end
    
    assert_redirected_to answer_path(assigns(:answer))
    # Realiza aserciones adicionales según tus requerimientos
  end
  
end

