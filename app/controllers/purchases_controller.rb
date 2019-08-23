class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product,only: [:new, :pay, :address, :card, :card_index]

  def new
    @card = current_user.card
    if @card 
      Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
    render layout: 'application-off-header-footer.html.haml'
  end

  def pay
    card = Card.find_by(user_id: current_user.id)
    deal = Deal.find_by(product_id: @product.id)
    if card
      Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
      charge = Payjp::Charge.create(
        amount:   @product.price,
        customer: card.customer_id,
        currency: 'jpy',
      )
      deal.charge_id = charge.id
      deal.buyer_id = current_user.id
      deal.position_id = 2 # ステータスを取引中に更新
      deal.deal_at = DateTime.now
      deal.save
      flash[:notice] = '商品を購入しました'
      redirect_to controller: :users, action: :show, id: current_user.id
    else
      flash[:alert] = 'カード情報を登録してください'
      redirect_to controller: :purchases, action: :new, product_id: @product.id
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
