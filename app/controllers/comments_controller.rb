class CommentsController < ApplicationController
  def index
    if params[:user_id]
      comments = Comment.where( {commentable_id: params[:user_id],
        commentable_type: "User"} )
    elsif params[:contact_id]
      comments = Comment.where( {commentable_id: params[:contact_id],
        commentable_type: "Contact"} )
    elsif params[:contact_share_id]
      comments = Comment.where( {commentable_id: params[:contact_share_id],
        commentable_type: "ContactShare"} )
    end

    render json: comments
  end

  def show
    comment = Comment.find(params[:id])

    if comment
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    comment = Comment.find(params[:id])

    if comment.update(comment_params)
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :body, :commentable_id,
      :commentable_type)
  end

end
