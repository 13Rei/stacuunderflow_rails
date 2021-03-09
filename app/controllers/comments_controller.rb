class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :body))
        redirect_to post_path(@post)
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @post.comments.find(params[:id]).destroy
        redirect_to post_path(@post)
    end
    
    def update
        @post = Post.find(params[:post_id])
        @post.comments.find(params[:id]).update(:isCorrect => 1)
        redirect_to post_path(@post)
    end
end