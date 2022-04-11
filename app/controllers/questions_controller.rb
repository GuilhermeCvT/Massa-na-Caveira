class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: %i[ show edit update destroy ]
  layout 'admin'

  # GET /companies or /companies.json
  def index
    @questions = Question.all.order(:priority).page params[:page]
  end

  # GET /companies/1 or /companies/1.json
  def show

  end

  # GET /companies/new
  def new
    @question = Question.new
  end

  # GET /companies/1/edit
  def edit

  end

  # POST /companies or /companies.json
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path , notice: "Praça cadastrada com sucesso!"
    else 
      render :new # renderiza a página de edit novamente 
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: "Praça atualizada com sucesso!"
    else 
      render :edit # renderiza a página de edit
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    
    if @question.destroy
      redirect_to questions_path, notice: "Praça excluída com sucesso!"
    else 
      render :index # renderiza a página de usuários 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:description, :enable, :priority, :type_question_id)
    end

    def determined_params
      params.require(:question).permit(:description, :question)
    end
end
