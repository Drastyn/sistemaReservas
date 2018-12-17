class User < ApplicationRecord
  has_many :reservas
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




  validates :email, presence: {message: " no puede estar en blanco"}
  validates :direccion, presence: {message: " no puede estar en blanco"}
  validates :nick_name, presence: {message: " no puede estar en blacno"}
  validates :nick_name, uniqueness: {message: " ya existente"}
  validates :telefono, numericality: {message: " solo debe contener numeros"}
  validates :telefono, uniqueness: {message: "ya existente"}
  validates :telefono, presence: {message: " no puede estar en blanco"}
  validates :nombres_apellidos, presence: {message: "no puede estar en blanco"}
  validates :nombres_apellidos, format: { :with =>/\A+[a-zA-Z\s]+\z/, message: "solo puede contener letras" }
end
