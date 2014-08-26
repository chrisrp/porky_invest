class IndiceCdiController < ApplicationController

  def new
    @indice_cdi = IndiceCdi.new
  end

  def create
    @indice_cdi = IndiceCdi.new(indice_cdi_params)
    @indice_cdi.save
  end


  private

  def indice_cdi_params
    params.require(:indice_cdi).permit(:taxa_di, :data)
  end

end
