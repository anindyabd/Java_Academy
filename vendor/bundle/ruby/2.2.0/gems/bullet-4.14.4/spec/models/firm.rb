class Firm < ActiveRecord::Base
  has_many :relationships
  has_many :clients, through: :relationships
end
