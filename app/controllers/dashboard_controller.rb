class DashboardController < ApplicationController

  def show
    @cdi = IndiceCdi.last
  end

end
