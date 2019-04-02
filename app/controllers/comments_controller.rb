class CommentsController < ApplicationController
#	before_action :configure_create_params, only: [:create]
	load_and_authorize_resource
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(content:params[:comment][:content], user: current_user)
		@post.comments << @comment
		@comment.save
		redirect_to @post
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @post
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_comment
			@comment = Comment.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def comment_params
			params.require(:comment).permit(:title, :content)
		end

end
