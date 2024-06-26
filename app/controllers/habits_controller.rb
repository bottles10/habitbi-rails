class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_habit, only: %i[ show edit update destroy plus minus ]


  def index
    @habits = current_user.habits.ordered
    @habit = current_user.habits.build
  end

  def show
  end

  def new
    @habit = current_user.habits.build
  end

  def create
    @habit = current_user.habits.build(habit_params)

    respond_to do |format|
      if @habit.save
        format.html { redirect_to habits_path, notice: "Habit was successfully create!." }
        format.turbo_stream { flash.now[:notice] = "Habit was successfully create!," }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @habit.update(habit_params)

      respond_to do |format|
        format.html { redirect_to habits_path, notice: "Habit was successfully updated!." }
        format.turbo_stream { flash.now[:notice] = "Habit was successfully updated!." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @habit.destroy

    respond_to do |format|
      format.html { redirect_to habits_path, notice: "Habit was successfully destroyed!." }
      format.turbo_stream { flash.now[:notice] = "Habit was successfully destroyed!." }
    end
  end

  def plus
    @habit.update(count: @habit.count + 1)
    render :result
  end

  def minus
    @habit.update(count: @habit.count - 1)
    render :result
  end
    



  private

  def set_habit
    @habit = current_user.habits.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(:name, :count)
  end
end
