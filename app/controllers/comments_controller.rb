class CommentsController < ApplicationController
	before_action :set_params
	before_action :set_comment, only: [:edit, :update]

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:notice] = "success"
			redirect_to novel_chapter_path(@chapter.novel.id, @chapter)
		else
			flash[:danger] = "fail"
			redirect_to novel_chapter_path(@chapter.novel.id, @chapter)
		end
	end

	def edit

	end

	def update
		if @comment.update(comment_params)
			redirect_to novel_chapter_path(@chapter.novel.id, @chapter)
		else
			redirect_to root_path
		end
	end

	private

	def set_comment
		@comment = Comment.find(params[:id])
	end

	def set_params
		@novel = Novel.find(params[:novel_id])
		@chapter = Chapter.find(params[:chapter_id])
	end

	def comment_params
		params.require(:comment).permit(:email, :content, :chapter_id)
	end
end