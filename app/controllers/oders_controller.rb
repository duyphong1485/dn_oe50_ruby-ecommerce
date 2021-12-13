class OdersController < ApplicationController
  def new
    @oder = current_account.oders.create
    @cart_items = get_line_items_in_cart
  end

  def create
    ActiveRecord::Base.transaction do
      @oder = current_account.oders.create
      @cart_items = get_line_items_in_cart
      create_oders_details
      @oder.assign_attributes(oder_params)
      @oder.save!
      flash[:success] = "Tạo đơn hàng thành công"
      session[:cart] = nil
      redirect_to root_path
    end
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  private

  def order_params
    params.require(:order).permit(:fullname, :phone, :address,
                                  :total_money)
  end

  def create_order_details
    @cart_items.each do |item|
      line_item = {product_id: item[:product].id, quantity: item[:quantity]}
      @order.order_details.create(line_item)
    end
  end
end