class User < ActiveRecord::Base
  after_create :assign_submitter_role
  after_create :assign_active_state

  has_many :suggestions, dependent: :destroy

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   # Virtual attribute for authenticating by either username or email
   # This is in addition to a real persisted field like 'username'
   attr_accessor :login

  # Overwrite Devise for Usernames & Emails
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  # Modify Devise to Allow Manual Account Activation
  def active_for_authentication?
    # Uncomment the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml
    super && active_account?
  end

  validates :username, :uniqueness => { :case_sensitive => false } # , :format => { ... } # etc.

  protected
    def assign_submitter_role
      self.add_role "submitter"
    end

    def assign_active_state
      self.update(:active_account => false)
    end
end
