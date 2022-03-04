class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: %i[ show edit update destroy ]
  layout 'admin'

  # GET /companies or /companies.json
  def index
    @companies = Company.all.order(:description).page params[:page]
  end

  # GET /companies/1 or /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit

  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to  companies_path , notice: "Praça cadastrada com sucesso!"
    else 
      render :new # renderiza a página de edit novamente 
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    if @company.update(company_params)
      redirect_to companies_path, notice: "Praça atualizada com sucesso!"
    else 
      render :edit # renderiza a página de edit
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    
    if @company.destroy
      redirect_to companies_path, notice: "Praça excluída com sucesso!"
    else 
      render :index # renderiza a página de usuários 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:description, :enable)
    end
end
