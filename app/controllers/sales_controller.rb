class SalesController < ApplicationController
  before_action :set_sale, only: [:edit, :destroy]

  def index
    @sales = Sale.paginate(page: params[:page], per_page:4)
  end

  def new
    @sale = Sale.create(total: 0)
    redirect_to edit_sale_path(@sale)
  end

  def edit
    @dishes_sale = @sale.sale_details
  end

  def destroy
    @sale.destroy
      respond_to do |format|
        format.html { redirect_to sales_url, notice: 'La venta ha sido cancelada.' }
        format.json { head :no_content }
    end
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:total)
  end
end
