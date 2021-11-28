class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
    return if @product

    flash[:danger] = t "message.product_not_exits"
    redirect_to root_path
  end
end
