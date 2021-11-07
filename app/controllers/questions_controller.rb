class QuestionsController < ApplicationController

  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<%= @test.questions(:id, :body).sort %>'
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render inline: '<%= @question.body %>'
    else
      render plain: "Вопрос не был создан!"
    end
  end

  def destroy
    @question.destroy
    render plain: 'Вопрос удален!'
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не нейден!'
  end
  
end