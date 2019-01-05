class User < ApplicationRecord
  has_many :reservas

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: {message: " No puede estar en blanco"}
  validates :direccion, presence: {message: " No puede estar en blanco"}
  validates :nick_name, presence: {message: " No puede estar en blacno"}
  validates :nick_name, uniqueness: {message: " Ya esta registrado"}
  validates :telefono, presence: {message: " No puede estar en blanco"}
  validates :telefono, numericality: {only_integer: true,message: " solo debe contener numeros"}
  validates :telefono, uniqueness: {message: " Ya esta registrado"}
  validates :telefono, length:{is: 8, message: " Invalido"}
  validates :nombres_apellidos, presence: {message: "no puede estar en blanco"}
  validates :nombres_apellidos, format: { :with =>/\A+[a-zA-Z\s]+\z/, message: " Solo puede contener letras" }
  validates :nombres_apellidos, length: {in: 20..50, message: " Ingrese su nombre completo por favor"}
  validate   :mayor_de_edad

  #verifica que el usuario que se registra sea mayor de 18 años
  def mayor_de_edad
    edad = Date.today.year - fecha_nacimiento.year
    if edad < 18 || fecha_nacimiento > Date.today
      errors.add(:fecha_nacimiento,"Incorrecta, aun no tienes 18 años.")
    end
  end
end
