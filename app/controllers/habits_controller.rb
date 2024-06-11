class HabitsController < ApplicationController
  before_action :set_habit, only: %i[ show edit update destroy]


  def index
    @habits = Habit.all.ordered
    @habit = Habit.new
  end

  def show
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)

    respond_to do |format|
      if @habit.save
        format.html { redirect_to habits_path, notice: "Habit was successfully create!." }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
  end

  def update
    if @habit.update(habit_params)

      respond_to do |format|
        format.html { redirect_to habits_path, notice: "Habit was successfully updated!." }
      end
    else
      render :edit, status: :unprocessable_entit
    end
  end

  def destroy
    @habit.destroy
      respond_to do |format|
        format.html { redirect_to habits_path, notice: "Habit was successfully destroyed!." }
        format.turbo_stream { flash.now[:notice] = "Habit wa successfully destroyed!." }
      end
    end


  private

  def set_habit
    @habit = Habit.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(:name, :count)
  end
end
