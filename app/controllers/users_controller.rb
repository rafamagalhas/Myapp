class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t('notice.created', model: @user.model_name.human) }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json

  def update
    case user_params[:use_provider_avatar]
    when '0'
      @user.use_provider_avatar=false
      load_actiondispatch_file!(user_params[:avatar], @user.user_folder, :avatar)
    when '1'
      @user.use_provider_avatar=true
    else
      @user.use_provider_avatar=false
    end

    @user.skill_level_id = user_params['skill_level_id']
    @user.notification_level_id = user_params['notification_level_id']
    @user.birthday = user_params['birthday']
    
    puts "Minha tag secreta é #{user_params['secret_tag']}"

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('notice.updated', model: @user.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :birthday, :email, :use_provider_avatar, :avatar, :skill_level_id, :notification_level_id, :secret_tag)
    end
end