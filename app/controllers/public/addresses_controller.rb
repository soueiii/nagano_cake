class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    # addressのcustomer_idにログイン中のcustomerのidを代入する
    @address.customer_id = current_customer.id
    @address.save!
    redirect_to public_addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
