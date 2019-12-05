class OrdersController < ApplicationController
  include CartsHelper
  before_action :create_cart_for_current_user
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
      currency: 'eur',
    })

    puts "#"*60
    puts "paiement ok"
    puts "#"*60   
    flash[:success] = "La commande a été payé"
    redirect_to root_path  
    #@cart = current_user.cart
    #@order = Order.new
    #@order.user = current_user
    #@order.order_details = @cart.cart_details
    #if @order.save
    #  @cart.items.clear
      # verifier l'etat du stock
    #  flash[:success] = "La commande a été payé"
    #  redirect_to root_path
    #end

    rescue Stripe::CardError => e
      flash.now[:error] = e.message
      render user_cart_path(@cart)
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
