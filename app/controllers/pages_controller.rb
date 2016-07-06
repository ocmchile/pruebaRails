class PagesController < ApplicationController
  def batman
  	values = Voto.group(:heroe).count
  	@batman = values["Batman"]
  end

  def superman
  	values = Voto.group(:heroe).count
  	@superman = values["Superman"]
  end

  def batmanVSsuperman
  end

  def okregistro
  	if params[:heroe].present? && params[:email].present?
	  	Voto.create(heroe: params[:heroe], email: params[:email])
	  	@votos = Voto.all
	  	redirect_to pages_batmanVSsuperman_path, notice: "El registro fue guardado"
	else
		redirect_to pages_batmanVSsuperman_path, notice: "DEBE INGRESAR TODOS LOS DATOS"
  	end
  end
end
