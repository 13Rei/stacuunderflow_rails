class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :body))
        redirect_to post_path(@post)
    end

    def update
        update_attribute(:isCorrect => 1)
    end

    def destroy
        @post = Post.find(params[:post_id])
        @post.comments.find(params[:id]).destroy
        redirect_to post_path(@post)
    end
end
