class ApplesController < ApplicationController
  def index
    @apples = ['Granny Smith', 'Honeycrisp']
  end
end