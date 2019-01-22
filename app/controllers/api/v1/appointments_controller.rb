class Api::V1::AppointmentsController < Api::V1::ApplicationController

  before_action :define_current_appointment

  def appointment_users
    all_appointments = Appointment.where(business_id: params[:business_id])
    time = DateTime.now
    appointments = all_appointments.select do |appointment|
      (appointment.date == time.strftime("%m/%d/%Y"))||(appointment.date == (time + 1).strftime("%m/%d/%Y"))||(appointment.date == (time + 2).strftime("%m/%d/%Y"))||(appointment.date == (time + 3).strftime("%m/%d/%Y"))||(appointment.date == (time + 4).strftime("%m/%d/%Y"))||(appointment.date == (time + 5).strftime("%m/%d/%Y"))||(appointment.date == (time + 6).strftime("%m/%d/%Y"))
    end
    appointment_users = appointments.map{|appointment| [User.find(appointment.appointment_user_id), appointment]}
    render json: appointment_users
  end

  def create
    appointment = Appointment.create(appointment_params)

    all_appointments = Appointment.where(business_id: params[:business_id])
    time = DateTime.now
    appointments = all_appointments.select do |appointment|
      (appointment.date == time.strftime("%m/%d/%Y"))||(appointment.date == (time + 1).strftime("%m/%d/%Y"))||(appointment.date == (time + 2).strftime("%m/%d/%Y"))||(appointment.date == (time + 3).strftime("%m/%d/%Y"))||(appointment.date == (time + 4).strftime("%m/%d/%Y"))||(appointment.date == (time + 5).strftime("%m/%d/%Y"))||(appointment.date == (time + 6).strftime("%m/%d/%Y"))
    end
    appointment_users = appointments.map{|appointment| [User.find(appointment.appointment_user_id), appointment]}
    render json: appointment_users
  end

  def index
    render json: Appointment.all
  end

  def show
    render json: current_appointment
  end

  def update
    current_appointment.update(appointment_params)
    render json: current_appointment
  end

  def destroy
    current_appointment.destroy

    all_appointments = Appointment.where(business_id: params[:business_id])
    time = DateTime.now
    appointments = all_appointments.select do |appointment|
      (appointment.date == time.strftime("%m/%d/%Y"))||(appointment.date == (time + 1).strftime("%m/%d/%Y"))||(appointment.date == (time + 2).strftime("%m/%d/%Y"))||(appointment.date == (time + 3).strftime("%m/%d/%Y"))||(appointment.date == (time + 4).strftime("%m/%d/%Y"))||(appointment.date == (time + 5).strftime("%m/%d/%Y"))||(appointment.date == (time + 6).strftime("%m/%d/%Y"))
    end
    appointment_users = appointments.map{|appointment| [User.find(appointment.appointment_user_id), appointment]}
    render json: appointment_users
  end

  def appointment_params
    params.permit(:appointment_user_id, :business_id, :id, :date)
  end

  def define_current_appointment
    if params[:id]
      @current_appointment = Appointment.find(params[:id])
    else
      @current_appointment = Appointment.new
    end
  end

  def current_appointment
    @current_appointment
  end

end
