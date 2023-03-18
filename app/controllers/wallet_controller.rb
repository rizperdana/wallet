class WalletController < ApplicationController
  def index
    @wallet = Wallet.all
  end

  def new
    @owner = params[:owner_type].constantize.new
    render partial: 'layout/owner_form'
  end
end
