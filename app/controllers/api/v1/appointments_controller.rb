class Api::V1::AppointmentsController < Api::V1::ApplicationController

  before_action :define_current_appointment

  def appointment_users
    all_appointments = Appointment.where(business_id: params[:business_id])
    time = DateTime.now.strftime("%m/%d/%Y")
    appointments = []
    all_appointments.each do |appt|
      if appt.date[6..9].to_i < time[6..9].to_i
        appt.destroy
      elsif (appt.date[6..9].to_i == time[6..9].to_i) && (appt.date[0..1].to_i < time[0..1].to_i)
        appt.destroy
      elsif (appt.date[6..9].to_i == time[6..9].to_i) && (appt.date[0..1].to_i == time[0..1].to_i) && (appt.date[3..4].to_i < time[3..4].to_i)
        appt.destroy
      else
        appointments.push(appt)
      end
    end
    appointment_users = appointments.map{|appointment| [User.find(appointment.appointment_user_id), appointment]}
    render json: appointment_users
  end

  def create
    appointment = Appointment.create(appointment_params)

    all_appointments = Appointment.where(business_id: params[:business_id])
    time = DateTime.now.strftime("%m/%d/%Y")
    appointments = []
    all_appointments.each do |appt|
      if appt.date[6..9].to_i < time[6..9].to_i
        appt.destroy
      elsif (appt.date[6..9].to_i == time[6..9].to_i) && (appt.date[0..1].to_i < time[0..1].to_i)
        appt.destroy
      elsif (appt.date[6..9].to_i == time[6..9].to_i) && (appt.date[0..1].to_i == time[0..1].to_i) && (appt.date[3..4].to_i < time[3..4].to_i)
        appt.destroy
      else
        appointments.push(appt)
      end
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
    time = DateTime.now.strftime("%m/%d/%Y")
    appointments = []
    all_appointments.each do |appt|
      if appt.date[6..9].to_i < time[6..9].to_i
        appt.destroy
      elsif (appt.date[6..9].to_i == time[6..9].to_i) && (appt.date[0..1].to_i < time[0..1].to_i)
        appt.destroy
      elsif (appt.date[6..9].to_i == time[6..9].to_i) && (appt.date[0..1].to_i == time[0..1].to_i) && (appt.date[3..4].to_i < time[3..4].to_i)
        appt.destroy
      else
        appointments.push(appt)
      end
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
