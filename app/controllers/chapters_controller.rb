class ChaptersController < ApplicationController
	skip_before_action :authenticate_user!, only: [:show]
	before_action :set_novel
	before_action :set_chapter, except: [:new, :create]
	
	def new
		@chapter = Chapter.new
	end

	def create
		@user = User.all
		@chapter = Chapter.new(chapter_params)
		@chapter.user = current_user
		if @chapter.save
			redirect_to novel_chapter_path(@novel, @chapter)
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @chapter.update(chapter_params)
			redirect_to novel_chapter_path(@novel, @chapter)
		else
			render 'edit'
		end
	end

	def show
		@chapters = Chapter.all
		@comment = Comment.new
	end

	def destroy
		@chapter.destroy
		redirect_to novel_path(@novel.id)
	end

	def form_comments
		 respond_to do |format|
      format.js  { render partial: 'comments/form_comments' }
     end		
	end

	private

	def set_novel
		@novel = Novel.find(params[:novel_id])
	end

	def set_chapter
		@chapter = Chapter.find(params[:id])
	end

	def chapter_params
		params.require(:chapter).permit(:chap, :name, :content, :user_id, :novel_id)
	end
end
