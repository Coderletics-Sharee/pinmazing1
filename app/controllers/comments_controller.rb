class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

before_action :authenticate_user!, except: [:index, :show]
  
  def edit
  end

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

def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @pin, notice: 'Comment was successfully updated.' }
        format.json { render json: @comment, status: :created, location: @comment}
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
  @comment = @pin.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end 
end

    
    

