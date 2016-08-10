class CartedProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @order = current_user.orders.find_by(completed: false)
    if !@order ||  !@order.carted_products
      flash[:info] = "You don't have any items in your cart."
      redirect_to "/"
    end
  end


  def create
    order = current_user.orders.find_by(completed: false) || Order.create(user_id: current_user.id, completed: false)
    carted_product = CartedProduct.new(product_id: params[:product_id], quantity: params[:quantity], order_id: order.id)
    if carted_product.save
      flash[:success] = "Item added to shopping cart."
      session
      redirect_to "/carted_products"
    else
      flash[:danger] = "Product not added. Something went wrong."
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id]).destroy
    flash[:warning] = "You removed #{carted_product.product.name} from your shopping cart!"
    redirect_to "/carted_products"
  end

end

