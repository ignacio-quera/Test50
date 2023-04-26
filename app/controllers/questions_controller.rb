class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end
      
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_name = current_user.name
    @question.created_at = Time.now

    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
