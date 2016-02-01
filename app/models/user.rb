class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pastes

  validates :username, presence: true,
                       uniqueness: true,
                       length: { in: 3..20,
                                 too_long: 'is too long',
                                 too_short: 'is too short' },
                       format: { with: /\A\w+\z/,
                                 message: 'may only contain numbers and letters' }
end
