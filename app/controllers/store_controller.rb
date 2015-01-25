class StoreController < ApplicationController
  def index
    @products = Product.all().order('products.title DESC')
  end
end
