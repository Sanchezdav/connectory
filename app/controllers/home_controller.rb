class HomeController < ApplicationController
  layout 'landing'

  def index
    @name = 'Connectory'
  end
end
