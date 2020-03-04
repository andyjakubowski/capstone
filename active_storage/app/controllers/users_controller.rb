class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.save!

    string = params[:user][:motto]
    mottoIO = StringIO.new string
    @user.motto.attach(
      io: mottoIO,
      filename: 'awesomeness.txt',
      content_type: 'text/plain',
      identify: false
    )

    redirect_to @user
  end

  def update
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:name, :avatar)
    end
end
