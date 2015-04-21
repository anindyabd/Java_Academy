class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]
  has_many :records
  has_many :lessons, through: :records

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      #user.name = auth.info.name   # assuming the user model has a name -- doesn't seem to work with Github
    end
  end

  def add_lesson(lessonid)
    if self.lessons.where( :id => lessonid ).blank?
      self.lessons << Lesson.find(lessonid) 
    else 
      return
    end 
  end

end
