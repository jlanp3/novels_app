class NovelsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show]
	before_action :find_chap, only: [:index, :show]
	before_action :set_novel, except: [:index, :new, :create]

	def index
		@novels = Novel.all
		@chapters = Chapter.all
	end

	def new
		@novel = Novel.new
	end

	def create
		@novel = Novel.new(novel_params)
		if @novel.save
			redirect_to @novel
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @novel.update(novel_params)
			redirect_to @novel
		else
			render 'edit'
		end
	end

	def show
		@novels = Novel.all
	end

	def destroy
		@novel.destroy
		redirect_to root_path
	end

	private

	def novel_params
		params.require(:novel).permit(:name)
	end

	def set_novel
		@novel = Novel.find(params[:id])
	end

	def find_chap
		@chapters = Chapter.where(novel_id: params[:id]).find_each
	end
end
