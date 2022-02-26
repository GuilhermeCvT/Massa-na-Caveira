class Admins::UsersController < AdminsController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    @entrances = Entrance.all
    @companies = Company.all
  end

  def update
    @user = User.find(params[:id])
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :company, :entrance)
  end
end
