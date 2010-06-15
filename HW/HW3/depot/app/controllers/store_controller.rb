class StoreController < ApplicationController
  before_filter :find_cart, :except => :empty_cart

  def index
    @products = Product.find_products_for_sale
    @cart = find_cart
    @time = Time.now
    @count = increment_count	# How many times has index been accessed
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @current_item = @cart.add_product(product)
    @count = session[:counter] = 0 #reset counter
    respond_to do |format|
      format.js if request.xhr?
      format.html {redirect_to_index} #why does this not invoke regardless of format.js line's result (one above)?
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    redirect_to_index("Invalid product")
  end

  def subtract_from_cart
    begin
      product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      redirect_to_index("Invalid product")
    else
      @cart = find_cart
      @current_item = @cart.subtract_product(product)

      respond_to do |format|
        format.js if request.xhr?
        format.html {redirect_to_index}
      end
    end
    # redirect_to_index unless request.xhr?
  end

  def empty_cart
    session[:cart] = nil #doesn't this belong in the model?
    respond_to do |format|
      format.js if request.xhr?
      format.html {redirect_to_index}
    end
  end

  def checkout
    @cart = find_cart
    if @cart.items.empty?
      redirect_to_index("Your cart is empty")
    else
      @order = Order.new
    end
  end

  def save_order
    @cart = find_cart
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      session[:cart] = nil
      redirect_to_index("Thank you for your order")
    else
      render :action => 'checkout'
    end
  end

  private

  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end

  def increment_count
    session[:counter] ||= 0 
    session[:counter] += 1
  end

  def find_cart
    @cart = (session[:cart] ||= Cart.new)
  end

  protected
  
  def authorize
  end
  
end
