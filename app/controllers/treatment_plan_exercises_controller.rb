class TreatmentPlanExercisesController < ApplicationController
  before_action :set_treatment_plan_exercise, only: %i[ show edit update destroy ]

  def move
    @exercise = TreatmentPlanExercise.find(params[:id])
    @exercise.insert_at(params[:position].to_i)
    head :ok
  end

  # GET /treatment_plan_exercises or /treatment_plan_exercises.json
  def index
    @treatment_plan_exercises = TreatmentPlanExercise.all
  end

  # GET /treatment_plan_exercises/1 or /treatment_plan_exercises/1.json
  def show
  end

  # GET /treatment_plan_exercises/new
  def new
    @treatment_plan_exercise = TreatmentPlanExercise.new
  end

  # GET /treatment_plan_exercises/1/edit
  def edit
  end

  # POST /treatment_plan_exercises or /treatment_plan_exercises.json
  def create
    @treatment_plan_exercise = TreatmentPlanExercise.new(treatment_plan_exercise_params)

    respond_to do |format|
      if @treatment_plan_exercise.save
        format.html { redirect_to @treatment_plan_exercise, notice: "Treatment plan exercise was successfully created." }
        format.json { render :show, status: :created, location: @treatment_plan_exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treatment_plan_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatment_plan_exercises/1 or /treatment_plan_exercises/1.json
  def update
    respond_to do |format|
      if @treatment_plan_exercise.update(treatment_plan_exercise_params)
        format.html { redirect_to @treatment_plan_exercise, notice: "Treatment plan exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @treatment_plan_exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treatment_plan_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatment_plan_exercises/1 or /treatment_plan_exercises/1.json
  def destroy
    @treatment_plan_exercise.destroy!

    respond_to do |format|
      format.html { redirect_to treatment_plan_exercises_path, status: :see_other, notice: "Treatment plan exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment_plan_exercise
      @treatment_plan_exercise = TreatmentPlanExercise.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def treatment_plan_exercise_params
      params.expect(treatment_plan_exercise: [ :treatment_plan_id, :exercise_id, :sets, :reps, :instructions ])
    end
end
