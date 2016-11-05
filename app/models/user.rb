require 'pry'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #not planning on using these this time :trackable, :rememberable
  devise :database_authenticatable, :registerable, :validatable, :omniauthable, :omniauth_providers => [:github]

  has_many :courses
  has_many :tasks, through: :courses
  has_many :cheers

 def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       binding.pry
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.username = auth.info.nickname
      user.password = Devise.friendly_token[0,20]
    end
  end

  def my_people_cheered
  	people = self.cheers.collect {|cheer| cheer.course.user}
  	people.flatten
  end

  def my_cheers_received
  	my_cheers = self.courses.collect{|course| course.cheers }
  	my_cheers.flatten
  end


end
