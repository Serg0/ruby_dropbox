class User < ActiveRecord::Base
  include Amistad::FriendModel

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter]

  validates :email, uniqueness: true, allow_nil: true
  scope :without_user, lambda{|user| user ? where("users.id != ?", user.id) : {} }
  scope :not_friends, ->(user){without_user(user).select{|item| ! (user.friend_with?(item) ||
      user.invited?(item) || user.invited_by?(item))}}

  has_many :incoming_files , :class_name => "FileMessage", :foreign_key => "recipient_id"
  has_many :outcoming_files , :class_name => "FileMessage", :foreign_key => "sender_id"

  def not_friends
    User.not_friends(self)
  end
  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth)

    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
    end
  end

  def email_required?
    super && provider.blank?
  end

#You can use an equivalent method for the password :

  def password_required?
    super && provider.blank?
  end

end
