class DashboardController < ApplicationController

  def show
    @cdi = IndiceDiario.last
  end

end
