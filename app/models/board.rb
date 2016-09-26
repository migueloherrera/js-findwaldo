class Board < ActiveRecord::Base
  has_many :characters
  has_many :players
end
