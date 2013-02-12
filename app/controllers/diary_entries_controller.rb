class DiaryEntriesController < ApplicationController

	def index

		@diary_entries = DiaryEntry.all

		@diary_entries_positive = DiaryEntry.positive
		
	end	

	def new
		@diary_entry = DiaryEntry.new
	end

	def create
	@diary_entry = DiaryEntry.create params["diaryentry"]

	if @diary_entry.save
		redirect_to diary_entries_path
	else
		render :new
		end
	end	
end

