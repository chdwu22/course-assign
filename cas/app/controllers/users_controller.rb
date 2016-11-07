class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :signup]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.full_name = @user.first_name + " " + @user.last_name
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "#{@user.full_name} was successfully added." }
      else
        format.html { render :new, notice: "Failed to add faculty." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #respond_to do |format|
      
      if @user.update(user_params)
        @user.full_name = @user.first_name + " " + @user.last_name
        @user.update(user_params)
        if !@user.is_admin
          redirect_to root_path
        else
          flash[:success] = "#{@user.full_name} was successfully updated."
          redirect_to users_path
          #format.html { redirect_to users_path, notice: "#{@user.full_name} was successfully updated." }
        end
      else
        flash[:notice] = "Failed to add faculty."
        render :edit
        #format.html { render :edit, notice: "Failed to add faculty." }
      end
    #end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def signup
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :is_admin, :email, :password, :full_name)
    end
end
