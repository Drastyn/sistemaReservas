class Reserva < ApplicationRecord
  has_many :users
  has_many :habitacions

  #validates :cantidadPersonas, numericality: {only_integer: true, message: "Favor ingrese la cantidad de personas para hacer la reserva"}, presence: {message: "campo en blanco"}
  #validates :cantidadHabitaciones, numericality: {only_integer: true, message: "Favor ingrese la cantidad de habitacion para hacer la reserva"}, presence: {message: "campo en blanco"}
  #validates :estadoReserva, length: {in: 7..50, message: "Favor ingrese estado"}, presence: {message: "campo en blanco"}
  #validates :precioReserva, numericality: {only_integer: true, message: "Cantidad total invalida"}, presence: {message: "campo en blanco"}
  validate :validar_entrada
  validate :validar_salida
  validate :fechas_distintas
  validate :salida_mayor_que_entrada
  validates :habitacions_id, presence: {message: " No puede estar en blanco"}
  validates :habitacions_id, numericality: {only_integer: true, message: " Ingresa solo numero"}
  validates :habitacions_id, length: {is: 1, message: "Ingresa una valida"}

  def validar_entrada
    if !fecha_ingreso.blank?
      if fecha_ingreso < Date.today
        errors.add(:fecha_ingreso, "Esa fecha ya paso")
      end
    else
      errors.add(:fecha_ingreso,"recuerda ingresar la fecha")
    end
  end

  def validar_salida
    if !fecha_salida.blank?
      if fecha_salida < Date.today
        errors.add(:fecha_salida,"Esa fecha ya paso")
      end
    else
      errors.add(:fecha_salida,"recuerda ingresar la fecha")
    end
  end

  def fechas_distintas
    if !fecha_ingreso.blank? && !fecha_salida.blank?
      if fecha_ingreso == fecha_salida
        errors.add(:fecha_salida,"recuerda que las fechas deben ser distintas")
      end
    end
  end

  def salida_mayor_que_entrada
      if !fecha_ingreso.blank? && !fecha_salida.blank?
        if fecha_ingreso > fecha_salida
          errors.add(:fecha_salida,"recuerda que esta fecha debe ser despues de la de ingreso")
        end
      end
  end
end
