class Player < ActiveRecord::Base
  before_validation :normalize_name, on: :create
  
  belongs_to :board
  validates :name, presence: true
  
  protected
    def normalize_name
      self.name = "Guest" if self.name.empty?
    end

end
