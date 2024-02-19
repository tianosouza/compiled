class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @latest_questions = Question.order(created_at: :desc).limit(5)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def search
    query = params[:query]
    @result = Question.where("question Like ? or response Like?", "%#{query}%", "%#{query}%")
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question was successfully created."
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:question, :response)
  end

end
