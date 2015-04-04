class Record < ActiveRecord::Base
    belongs_to :user
    belongs_to :lesson, dependent: :destroy
    scope :done_by_user, -> (user_id) {where(user_id: user_id)}
    

end
