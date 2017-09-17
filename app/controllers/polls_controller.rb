class PollsController < ApplicationController
	load_and_authorize_resource

	def index
		@polls = Poll.all
	end

	def new
    @poll = current_user.polls.new
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      redirect_to polls_path
      flash[:success] = "Poll created successfully"
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @poll.update(poll_params)
      redirect_to polls_path
      flash[:success] = "Poll updated successfully"
    else
      render :edit
    end
  end

  def destroy
    if @poll.destroy
      redirect_to new_poll_path
      flash[:success] = "Poll destroyed successfully"
    else
      redirect_to polls_path
      flash[:error] = "Poll destroy failed"
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:title, :description, :creator_id)
  end
end
