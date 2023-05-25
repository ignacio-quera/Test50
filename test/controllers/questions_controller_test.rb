require 'test_helper'
require 'simplecov'
SimpleCov.start

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question_one = questions(:one)
    @question_two = questions(:two)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    # Realiza aserciones adicionales según tus requerimientos
  end
  
  test "should create question" do
    assert_difference('Question.count') do
      post :create, params: { question: { content: @question_one.content, product_id: @question_one.product_id, user_id: @question_one.user_id } }
    end
    
    assert_redirected_to question_path(assigns(:question))
    # Realiza aserciones adicionales según tus requerimientos
  end
  
end

