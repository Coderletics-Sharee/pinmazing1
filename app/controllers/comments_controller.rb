class CommentsController < ApplicationController
  #before_filter :user_signed_in

  def index
    @comments = Comment.all
  end

  def new
    @comment = @pin.comments.build(params[:comment].permit(:body))
  end

  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.build(params[:comment].permit(:body))
    @comment.pin_id = @pin.id
    @comment.user_id = current_user.id
    
    respond_to do |format|
  if @comment.save
    format.html {redirect_to @pin, notice: "Comment was successfully created"}
    format.json {render json: @pin, status: :created, location: @comment}
  else
    format.html {render action: 'new'}
    format.json {render json: @comment.errors, status: :unprocessable_entity}
  end
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
    @pin = @comment.pin

    respond_to do |format|
    if @comment.update_attributes(params[:comment].permit(:body))
    format.html {redirect_to @pin, notice: "Comment was successfully updated"}
    format.json {render json: @pin, status: :created, location: @comment}
    else
    format.html {render action: 'edit'}
    format.json {render json: @comment.errors, status: :unprocessable_entity}
  end
  end
end

  def destroy
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
    @comment.delete
    redirect_to @pin
  end
end
