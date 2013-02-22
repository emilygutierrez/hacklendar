class DiaryEntry < ActiveRecord::Base
    attr_accessible :description, :title, :mood


  def self.positive
    where(mood: "happy")
  end  

  validates :description, presence: true
  validates :title, presence: true, uniqueness: true

  def mood_is_happy
  	if Time.now.monday? || Time.now.thursday?
  	 errors.add(:mood_is_happy, "must be happy")
    end
  end		
end