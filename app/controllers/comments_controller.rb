class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  
  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.create(params[:comment])
    if @comment.save
    redirect_to @pin, notice: 'Comment was successfully created.'
    else
    render action: 'new'  
end
end
end
