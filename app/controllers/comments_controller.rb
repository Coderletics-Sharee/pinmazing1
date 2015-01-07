class CommentsController < ApplicationController
  #before_filter :user_signed_in

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.create(comment_params)
    @comment.pin_id = @pin.id
    @comment.user_id = current_user.id
  if @comment.save
    flash[:success] = "Comment created!"
    redirect_to pin_path(@pin)
  else
    flash[:error] = "No comment created!"
    redirect_to pin_path(@pin)
  end

end

  def show
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
  end

  def edit
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
  end 

  
  def update
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
    if @comment.update(comment_params)
    redirect_to @pin, notice: 'Comment was successfully updated.'
  else
    render action: 'edit'   
  end
end

  
  def destroy
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
    @comment.delete
    redirect_to @pin
  end

  private
    def comment_params 
      params.require(:comment).permit(:body)
  end
end
