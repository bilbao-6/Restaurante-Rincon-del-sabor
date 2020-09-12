class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :user_mailer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :sales
         has_one :profile

         def user_mailer
           UserMailer.bienvenida_mailer(@user).deliver_later!
         end
end
