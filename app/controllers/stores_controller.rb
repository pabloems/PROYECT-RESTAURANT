require_relative "../models/user"
require_relative "../models/store"

class StoresController < ApplicationController

  before_action :set_store, only: [:edit, :update]

  # def new
  #   @store = Store.new
  # end

  # def create
  #   @store = Store.new(store_params)
  #   @store.users
  #   if @store.save
  #     redirect_to root_path
  #   end
  # end

  def edit
  end

  def update
    @store.update(store_params)
    redirect_to root_path
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit( :name, :address, :phone)
  end
end