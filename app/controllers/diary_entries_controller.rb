class DiaryEntriesController < ApplicationController

	def index
		if params[:day]
			@day = params[:day].to_date
		else
			@day = Date.today
		end	
		@diary_entries = DiaryEntry.where(created_at: @day.beginning_of_day..@day.end_of_day)
		@all_entries = DiaryEntry.where(created_at: @day.beginning_of_month..@day.end_of_month)

		@dates = @all_entries.map do |i|
			i.created_at.to_date
		end	

		@diary_entries_positive = DiaryEntry.positive
		
	end	

	def new
		@diary_entry = DiaryEntry.new
	end

	def create
	@diary_entry = DiaryEntry.new params["diary_entry"]

	if @diary_entry.save
		redirect_to diary_entries_path
	else
		render :new
		end
	end	
end

