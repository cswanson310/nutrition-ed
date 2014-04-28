require 'bcrypt'

# password stuff taken from http://www.therailsway.com/2009/8/3/users-and-passwords/
# very helpful!
class User < ActiveRecord::Base

  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  extend FriendlyId

  friendly_id :url_name, use: :slugged

  def url_name
    #check for reserved names, don't want a use with new as their name
    case username.parameterize
    when 'new' then 'new2'
    when 'edit' then 'edit2'
    else username.parameterize
    end
  end

  # Create two virtual (in memory only) attributes to hold the password and its confirmation.
  attr_accessor :new_password, :new_password_confirmation

  ### VALIDATIONS ###

  # We need to validate that the user has typed the same password twice
  # but we only want to do the validation if they've opted to change their password.
  validates_confirmation_of :new_password, if: :password_changed?, message: "Passwords don't match"

  validates_uniqueness_of :username, message: 'That username has already been taken'

  before_save :hash_new_password, :if=>:password_changed?
  before_save :create_skills

  # By default the form_helpers will set new_password to "",
  # we don't want to go saving this as a password
  def password_changed?
    !@new_password.blank?
  end

  # As is the 'standard' with rails apps we'll return the user record if the
  # password is correct and nil if it isn't.
  def self.authenticate(username, password)
    # Because we use bcrypt we can't do this query in one part, first
    # we need to fetch the potential user
    if user = find_by_username(username)
      # Then compare the provided password against the hashed one in the db.
      if BCrypt::Password.new(user.hashed_password).is_password? password
        # If they match we return the user 
        return user
      end
    end
    # If we get here it means either there's no user with that email, or the wrong
    # password was provided.  But we don't want to let an attacker know which. 
    return nil
  end

  private
  # This is where the real work is done, store the BCrypt has in the
  # database
  def hash_new_password
    self.hashed_password = BCrypt::Password.create(@new_password)
    @new_password = nil
    @new_password_confirmation = nil
  end

  def create_skills
    Skill.all.each do |skill|
      self.skills << skill
    end
  end

end
