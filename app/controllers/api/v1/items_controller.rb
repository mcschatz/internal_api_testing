class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    if item.save
      respond_with item, status: :created, location: [:api, :v1, item]
    else
      respond_with errors: item.error, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
