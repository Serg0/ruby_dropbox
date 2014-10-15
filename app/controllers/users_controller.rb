class UsersController < ApplicationController
  before_action :authenticate_user!, :set_user, only: [:show, :edit, :update, :destroy, :invite]


  # GET /users
  # GET /users.json

  before_action :authenticate_user!
  def index
    @users = User.without_user(current_user)

  end

  def friends
    @users = current_user.friends
  end

  def not_friends
    @users = User.not_friends(current_user)
  end

  def in_invites
    @users = current_user.pending_invited_by
  end

  def out_invites
    @users = current_user.pending_invited
  end

=begin
TODO
  get :
  get :out_invites
  get :in_invites
  get :not_friends
=end

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
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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


  def invite
    send(:friend_action, :invite, 'Invite successfully sent', 'Unable to send invite')
  end


  def approve
    send(:friend_action, :approve, 'Friend request approved', 'Unable to approve friend request' )
  end


  @@action_options = [:invite, :approve]

  def friend_action(action, success_message, fail_msg)

    user = User.find(params[:id])

    respond_to do |format|
      if !@@action_options.include?(action)

        msg = "Unable to find action #{action}"
        format.html { redirect_to :back, notice: msg }
      else
        if (user)
          if  current_user.send(action, user)
            format.html { redirect_to :back, notice: success_message }
          else
            format.html { redirect_to :back, notice: fail_msg }
          end
        else
          fail_msg_not_found = "#{fail_msg}. User not found"
          format.html { redirect_to :back, notice: fail_msg_not_found }
        end
      end

    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end
end
