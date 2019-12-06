class OrderDetailsController < ApplicationController
  include CartsHelper
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_cart_for_current_user
  before_action :create_contact_for_current_user
  
  def index
  end

  def show
  end

  def new
  end

  def create

    @amount = (sum_cart?*100).to_i
    
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Paiement de la commande',
      currency: 'usd',
    })

    puts "#"*60
    puts "paiement ok"
    puts "#"*60   
    
    @cart = current_user.cart
    @order = Order.create(user_id: current_user.id, date: Time.now)
    @cart.cart_details.each do |cart_detail|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.artwork_id = cart_detail.artwork_id
      @order_detail.quantity = cart_detail.quantity
      @order_detail.save
    end
    @cart.cart_details.clear
      # verifier l'etat du stock
    flash[:success] = "La commande a été payé"
    redirect_to root_path

    rescue Stripe::CardError => e
      flash.now[:error] = e.message
      render user_cart_path(@cart)
  end

  

  def update
  end

  def destroy
  end

  def delete
  end

  def edit
  end
end
