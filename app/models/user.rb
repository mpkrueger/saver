class User < ApplicationRecord
  has_one :investing_profile, dependent: :destroy
  has_many :feedbacks
  has_one :investing_feedback, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
