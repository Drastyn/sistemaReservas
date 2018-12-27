class Reserva < ApplicationRecord
  belongs_to :user

  validate :fechaIngreso_no_debe_ser_pasada_
  validate :fechaSalida_no_debe_ser_pasada_, :fechaSalida_entre
  validate :fechaIngreso
  validate :fechaSalida
  validates :cantidadPersonas, numericality: {only_integer: true, message: "Favor ingrese la cantidad de personas para hacer la reserva"}, presence: {message: "campo en blanco"}
  validates :cantidadHabitaciones, numericality: {only_integer: true, message: "Favor ingrese la cantidad de habitacion para hacer la reserva"}, presence: {message: "campo en blanco"}
  validates :estadoReserva, length: {in: 7..50, message: "Favor ingrese estado"}, presence: {message: "campo en blanco"}
  validates :precioReserva, numericality: {only_integer: true, message: "Cantidad total invalida"}, presence: {message: "campo en blanco"}

  def fechaIngreso_no_debe_ser_pasada_
    if !fechaIngreso.blank? and fechaIngreso < Date.today
      errors.add(:fechaIngreso,"Esa fecha ya paso")
    end
  end

  def fechaSalida_no_debe_ser_pasada_
    if !fechaSalida.blank? and fechaSalida < Date.today
      errors.add(:fechaSalida,"Esa fecha ya paso")
    end
  end

  def fechaSalida_entre
    if !fechaSalida == fechaIngreso
      errors.add(:fechaSalida,"La fecha de fecha de salida no puede ser la misma que la de entrada ")
    end
  end

end
