class DiaryEntry < ActiveRecord::Base
	attr_accessible :description, :title, :mood
end	