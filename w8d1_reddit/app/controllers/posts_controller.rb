class PostsController < ApplicationController
    before_action :require_to_be_author, only: [:edit, :create]

    def new
        @post = Post.new
        render :new
    end

    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to post_url(@post)
        else
            flash[:errors] = ["Error occured while creating post"]
            redirect_to new_post_url
        end
    end

    def edit
        render :edit
    end

    def update
        @post = Post.find_by(id: params[:id])

        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash[:errors] = ["Unable to edit post."]
            redirect_to edit_post_url(@post)
        end

    end

    private

    def require_to_be_author
        return if current_user.posts.find_by(id: params[:id])
        flash[:errors] = ["You are not the author"]
        redirect_to subs_url
    end

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
    end

end
