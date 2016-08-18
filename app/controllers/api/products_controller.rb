class Api::ProductsController < ApplicationController
  def index
    # binding.pry
    @products = Product.all
  end
  private
  def collection
    # binding.pry
    @products ||= Product.search_by(params)
  end

  def resource
    @product ||= Product.find(params[:id])
  end
end
