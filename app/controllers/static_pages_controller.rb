class StaticPagesController < ApplicationController
  def home
    @products = Product.page(params[:page]).per(Settings.page_record_medium)
                       .recent
    @categorys = Category.select(:name)
  end

  def introduce; end
end
