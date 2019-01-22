class Habitacion < ApplicationRecord
  has_many :reservas

  validates :descripcionHabitacion, length: {in: 7..200, message: "Favor ingrese una descripcion de la habitacion"}, presence: {message: "campo en blanco"}
  validates :tipoHabitacion, length: {in: 7..50, message: "Favor ingrese el tipo de habitacion"}, presence: {message: "campo en blanco"}
  validates :numeroPersonas, numericality: {only_integer: true, message: "Favor ingrese la cantidad de personas que tiene la habitacion"}, presence: {message: "campo en blanco"}
  validates :tarifa_habitacion, numericality: {only_integer: true, message: "Favor solo ingrese numeros enteros"}
  validates :tarifa_habitacion, presence: {message: "Campo en blanco"}
  validate  :validar_tarifa
  validates  :estado_habitacion, presence: { message: " No puede estar en blanco"}
  validate :numero_habitacion_no_blanco
  validates :numero_habitacion, numericality: {only_integer: true, message: "Recuerda que debe ser un numero entero"}
  validate :validar_numeros_habitaciones

  has_attached_file :photo,
                    style: { medium: "1280x720", thumb: "800x600", mini: "400x200" },
                    default_url: "/images/:style/missing_photo.png",
                    preserve_files: true
  validates_attachment :photo, content_type: { content_type: [/png\z/, /jpe?g\z/]}
  validates :photo, attachment_presence: :true

  def numero_habitacion_no_blanco
    if numero_habitacion.blank?
      errors.add(:numero_habitacion,"No puede estar en blanco")
    end
  end
  #valida que el numero de la habitacion sea unico si esta activa
  validates_uniqueness_of :numero_habitacion, conditions: -> {where(status_habitacion: 'activa')}
  #valida que el precio de la tarifa no sea nulo (blanco).
  def tarifa_no_nula
    if tarifa_habitacion == nil
      errors.add(:tarifa_habitacion,"Campo en blanco")
    end
  end

  #valida el numero de habitacion no mayor 9
  def validar_numeros_habitaciones
    if !numero_habitacion.blank?
      if numero_habitacion > 9  || numero_habitacion < 1
        errors.add(:numero_habitacion,"recuerda que nuestro rango de habitaciones es de 1 a 9")
      end
    end
  end

  #valida que la tarifa de la habitacion no sea menor a $10000
  def validar_tarifa
    if(tarifa_habitacion != nil)
      if tarifa_habitacion < 10000 || tarifa_habitacion > 200000
        errors.add(:tarifa_habitacion, "Ingrese una tarifa adecuada, recuerda que nuestro rango de precios va desde los $10000 hasta los $200000")
      end
    end
  end
end
