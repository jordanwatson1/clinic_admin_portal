class TreatmentPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_treatment_plan, only: %i[ show edit update destroy ]

  # GET /treatment_plans or /treatment_plans.json
  def index
    @patient = current_user.patients.find(params[:patient_id])
    @treatment_plans = @patient.treatment_plans.includes(:treatment_plan_exercises)
  end

  # GET /treatment_plans/1 or /treatment_plans/1.json
  def show
  end

  # GET /treatment_plans/new
  def new
    @patient = Patient.find(params[:patient_id])
    @treatment_plan = @patient.treatment_plans.build
    @treatment_plan.treatment_plan_exercises.build if @treatment_plan.treatment_plan_exercises.empty?
  end

  # GET /treatment_plans/1/edit
  def edit
  end

  # POST /treatment_plans or /treatment_plans.json
  def create
    @treatment_plan = @patient.treatment_plans.build(treatment_plan_params)
    @treatment_plan.user = current_user

    respond_to do |format|
      if @treatment_plan.save
        format.html { redirect_to patient_treatment_plan_path(@patient, @treatment_plan), notice: "Treatment plan was successfully created." }
        format.json { render :show, status: :created, location: patient_treatment_plan_path(@patient, @treatment_plan) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treatment_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatment_plans/1 or /treatment_plans/1.json
  def update
    logger.debug params[:treatment_plan].inspect

    respond_to do |format|
      if @treatment_plan.update(treatment_plan_params)
        format.html { redirect_to patient_treatment_plan_path(@patient, @treatment_plan), notice: "Treatment plan was successfully updated." }
        format.json { render :show, status: :ok, location: patient_treatment_plan_path(@patient, @treatment_plan) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treatment_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatment_plans/1 or /treatment_plans/1.json
  def destroy
    @treatment_plan.destroy
    respond_to do |format|
      format.html { redirect_to patient_path(@patient), notice: "Treatment plan was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    def set_patient
      @patient = current_user.patients.find(params[:patient_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_treatment_plan
      @treatment_plan = @patient.treatment_plans.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treatment_plan_params
      params.require(:treatment_plan).permit(
        :title, :notes,
        treatment_plan_exercises_attributes: [ :id, :exercise_id, :sets, :reps, :instructions, :_destroy ]
      )
    end
end
