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
<<<<<<< HEAD
  if @comment.save
    flash[:success] = "Comment created!"
    redirect_to pin_path(@pin)
  else
    flash[:error] = "No comment created!"
    redirect_to pin_path(@pin)
  end

end
=======
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to pin_path(@pin)
    else
      flash[:error] = "No Comment created!"
      redirect_to pin_path(@pin)
    end  
  
  end
>>>>>>> ace6ab78c391f2e665f053ce55feeb9f8019ed2f

  def show
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
  end

  def edit
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
  end 

<<<<<<< HEAD
  
=======

>>>>>>> ace6ab78c391f2e665f053ce55feeb9f8019ed2f
  def update
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
    if @comment.update(comment_params)
<<<<<<< HEAD
    redirect_to @pin, notice: 'Comment was successfully updated.'
  else
    render action: 'edit'   
  end
end
=======
      redirect_to @pin, notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end
  end

>>>>>>> ace6ab78c391f2e665f053ce55feeb9f8019ed2f

  
  def destroy
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
    @comment.delete
    redirect_to @pin
  end

<<<<<<< HEAD
  private
    def comment_params 
      params.require(:comment).permit(:body)
  end
=======

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
>>>>>>> ace6ab78c391f2e665f053ce55feeb9f8019ed2f
end
