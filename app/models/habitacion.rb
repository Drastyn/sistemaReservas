class Habitacion < ApplicationRecord
  has_many :reservas

  validates :descripcionHabitacion, length: {in: 7..200, message: "Favor ingrese una descripcion de la habitacion"}, presence: {message: "campo en blanco"}
  validates :tipoHabitacion, length: {in: 7..50, message: "Favor ingrese el tipo de habitacion"}, presence: {message: "campo en blanco"}
  validates :numeroPersonas, numericality: {only_integer: true, message: "Favor ingrese la cantidad de personas que tiene la habitacion"}, presence: {message: "campo en blanco"}
  validates :tarifa_habitacion, numericality: {only_integer: true, message: "Favor solo ingrese numeros enteros"}
  validates :tarifa_habitacion, presence: {message: "Campo en blanco"}
  validate  :validar_tarifa
  validates  :estado_habitacion, presence: { message: " No puede estar en blanco"}
  validates :numero_habitacion, presence: {message: " No puede estar en blanco"}
  validates :numero_habitacion, numericality: {only_integer: true, message: "Recuerda que debe ser un numero entero"}
  validates_uniqueness_of :numero_habitacion, :scope => :status_habitacion

  def tarifa_no_nula
    if tarifa_habitacion == nil
      errors.add(:tarifa_habitacion,"Campo en blanco")
    end
  end

  #valida que la tarifa de la habitacion no sea menor a $10000
  def validar_tarifa
    if(tarifa_habitacion != nil)
      if tarifa_habitacion < 10000 || tarifa_habitacion > 200000
        errors.add(:tarifa_habitacion, "Ingrese una tarifa adecuada")
      end
    end
  end
end
