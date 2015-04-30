class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google] #:omniauth_providers => [:github], 
  has_many :records 
  has_many :lessons, through: :records

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.name = auth.info.name
  #     user.password = Devise.friendly_token[0,20]
  #   end
  # end

  def self.find_for_google_oauth2(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

   
    unless user
        user = User.create(name: data["name"],
           email: data["email"],
           password: Devise.friendly_token[0,20]
        )
    end
    user
end

  def add_lesson(lessonid)
    if self.lessons.where( :id => lessonid ).blank?
      self.lessons << Lesson.find(lessonid) 
    end 
  end

end
