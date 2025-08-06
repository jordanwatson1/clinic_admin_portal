class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[show edit update destroy]

  def index
    @appointments = Appointment
                      .includes(:patient)
                      .joins(:patient)
                      .where(patients: { user_id: current_user.id })
                      .order(:start_time)
  end

  def show; end

  def new
    @patient = current_user.patients.find(params[:patient_id])
    @appointment = @patient.appointments.new
  end

  def edit
  end

  def create
    @patient = current_user.patients.find(params[:patient_id])
    @appointment = @patient.appointments.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to patient_appointment_path(@patient, @appointment), notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to patient_path(@appointment.patient), notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment.destroy!

    respond_to do |format|
      format.html { redirect_to patient_appointments_path(@appointment.patient), status: :see_other, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_appointment
    @patient = current_user.patients.find(params[:patient_id])
    @appointment = @patient.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :notes)
  end
end
