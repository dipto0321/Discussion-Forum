class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion only: [:create, :edit, :update, :show, :destroy]
  before_action :set_reply only: [:edit, :update, :show, :destroy]

  def new
  end

  def create
    @reply = @discussion.replies.build(reply_params)
    @reply.user_id = current_user.id
    respond_to do |format|
      if @reply.save
        format.html { redirect_to discussion_path(@discussion) }
      else
        format.html { redirect_to discussion_path(@discussion), notice: "Reply didn't save. Please try again! " }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to discussion_path(@discussion), notice: "Reply has successfully updated!" }
      else
        format.html { redirect_to discussion_path(@discussion), notice: "Reply hasn't updated. Please try again! " }
      end
    end
  end

  def destroy
    @reply.destroy
    redirect_to discussion_path(@discussion)
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  def set_reply
    @reply = @discussion.replies.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:reply)
  end
end
