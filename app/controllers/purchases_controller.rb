class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
  end
end
