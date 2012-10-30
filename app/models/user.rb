class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pastes

  validates_presence_of :username  
  validates_uniqueness_of :username
  validates_length_of :username, :within => 3..20, 
                      :too_long => "is too long", :too_short => "is too short"
  validates_format_of :username, :with => /\A\w+\z/, 
                      :message => 'may only contain numbers and letters'

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, 
                  :remember_me, :username
end
