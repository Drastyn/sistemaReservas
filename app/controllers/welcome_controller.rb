class WelcomeController < ApplicationController
  def index
    @face = 'https://www.facebook.com/hostelmyhouse/'
    @booking = 'https://www.booking.com/hotel/cl/my-house-hostel.es.html'
    @instagram = 'https://www.instagram.com/hostalmyhouse/'
    @direccion = 'Bellavista 115, 2580067 Viña del Mar, Chile'
    @fono = 'Aqui va el telefono'
  end
end
