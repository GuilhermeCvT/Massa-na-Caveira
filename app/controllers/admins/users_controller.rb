class Admins::UsersController < AdminsController
  before_action :verify_password, only: [:update]
  before_action :set_user, only: [:edit, :update]
  before_action :create, only: [:params_user]

  def index
    @users = User.all.order(:id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)

    if @user.save
      redirect_to admins_users_path, notice: "Usuário Cadastrado com sucesso!"
    else 
      render :new # renderiza a página de edit novamente 
    end
  end

  def edit

  end

  def update
    if @user.update(params_user)
      redirect_to admins_users_path, notice: "Usuário atualizado com sucesso!"
    else 
      render :edit # renderiza a página de edit novamente 
    end
  end

  private
  def params_user
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :company_id, :entrance_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def verify_password
    if params[:user][:password].blank? && params[:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end
end
