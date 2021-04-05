class EntriesController < ApplicationController

  def index
    @entries = Entry.order('created_at DESC')
  end

  def new
    @entry = Entry.new 
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:notice] = "Timesheet Entry create successful"
      redirect_to root_path
    else
      flash[:alert] = @entry.errors.full_messages
      redirect_to new_entry_path
    end
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.save
      flash[:notice] = "Timesheet Enrty update successful"
    else
      flash[:alert] = @entry.errors.full_messages
    end
    redirect_to root_path
  end

  def destroy

  end

  private

  def entry_params
    params.require(:entry).permit(:date, :start_time, :finish_time)
  end
  
end
