class DiaryEntry < ActiveRecord::Base
    attr_accessible :description, :title, :mood


  def self.positive
    where(mood: "happy")
  end  

end