class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  
  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.create(params[:comment].permit(:body))
    
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
end

