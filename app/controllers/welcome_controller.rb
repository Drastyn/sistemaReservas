class WelcomeController < ApplicationController
  #verefica que el usuario no este inactivo
  #si esta inactivo lo "deslogea"
  def autenticar
    if user_signed_in? && current_user.inactivo?
      sign_out_and_redirect(current_user)
    end
  end
  def index
    autenticar
  end
end
