class OmniauthCallbacksController
  # To change this template use File | Settings | File Templates.


=begin
  def all
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
=end


  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

=begin
  skip_before_filter :authenticate_user!
  def all
    p env["omniauth.auth"]
    user = User.from_omniauth(env["omniauth.auth"], current_user)
    if user.persisted?
      flash[:notice] = "You are in..!!! Go to edit profile to see the status for the accounts"
      sign_in_and_redirect(user)
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  def failure
    #handle you logic here..
    #and delegate to super.
    super
  end
=end

=begin
  alias_method :facebook, :all
  alias_method :twitter, :all
=end


end