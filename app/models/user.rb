class User < ApplicationRecord

  after_create :create_userparam

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   	has_one :userparam
   	has_many :ratings
   	has_many :rating_comments
   	has_many :institution_comments
   	has_many :votes

   	private

   	def create_userparam
   		@userparam=Userparam.create(user_id: self.id,name: self.email.split(/@/)[0])
   		@userparam.save
   	end

end
