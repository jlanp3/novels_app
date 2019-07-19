class ChaptersController < ApplicationController
	skip_before_action :authenticate_user!, only: [:show]
	
	def new
		@novel = Novel.all
		@chapter = Chapter.new
	end

	def create
		@chapter = Chapter.new(chapter_params)
		@chapter.user = current_user
		if @chapter.save
			redirect_to @chapter
		else
			render 'new'
		end
	end

	def edit
		@chapter = Chapter.find(params[:id])
	end

	def update
		@chapter = Chapter.find(params[:id])
		if @chapter.update(chapter_params)
			redirect_to @chapter
		else
			render 'edit'
		end
	end

	def show
		@novels = Novel.all
		@chapter = Chapter.find(params[:id])
	end

	def destroy
		@chapter = Chapter.find(params[:id])
		@chapter.destroy
		redirect_to root_path
	end


	private

	def chapter_params
		params.require(:chapter).permit(:chap, :name, :content, :user_id, :novel_id)
	end
end
