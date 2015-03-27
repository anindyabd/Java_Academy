class User < ActiveRecord::Base
    has_many :records
    has_many :lessons, through :records


end
