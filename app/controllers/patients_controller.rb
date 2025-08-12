# app/controllers/patients_controller.rb
class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: %i[show edit update destroy]

  def index
    @patients = current_user.patients
  end

  def show; end

  def new
    @patient = current_user.patients.build
  end

  def edit; end

  def create
    @patient = current_user.patients.build(patient_params)
    if @patient.save
      redirect_to @patient, notice: "Patient was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: "Patient was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy!
    redirect_to patients_path, status: :see_other, notice: "Patient was successfully destroyed."
  end

  private

  def set_patient
    @patient = current_user.patients.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob, :email, :phone)
  end
end
