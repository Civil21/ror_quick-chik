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
   	has_many :rating_votes
   	has_many :rating_comment_votes
   	has_many :institution_comment_votes

   	private

   	def create_userparam
   		@userparam=Userparam.create(user_id: self.id,name: self.email.split(/@/)[0],facebook_url: "https://uk-ua.facebook.com/")
   		@userparam.save
   	end

end
