class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@posts = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end

end