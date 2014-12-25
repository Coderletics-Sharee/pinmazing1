class CommentsController < ApplicationController
  #before_action :set_comment, only: [:show, :edit, :update, :destroy]
#def new
  #@pin = Pin.find(params[:pin_id])
  #@comment = current_user.comments.build
#end

  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.create(params[:comment].permit(:body))

    @comment.pin_id = @pin.id
    @comment.user_id = current_user.id

    respond_to do |format|  
    if @comment.save
    format.html { redirect_to @pin, notice: 'Comment was successfully created.'}
    format.json { render json: @comment, status: :created, location: @comment}
    else
    format.html { render action: "new" }
    format.json { render json: @comment.errors, status: :unprocessable_entity} 
    end
    end
end

  def update
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])

    @comment.pin_id = @pin.id
    @comment.user_id = current_user.id

    if @comment.update
        redirect_to @pin, notice: 'Comment was successfully updated.'
    else
    render action: 'edit'
    end
  end

  def destroy
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
    @comment.destroy
    redirect_to @pin
  end
end 

    
    

