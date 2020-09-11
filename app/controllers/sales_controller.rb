class SalesController < ApplicationController

  def index
    @sales = Sale.paginate(page: params[:page], per_page:4)
  end

  def new
    @sale = Sale.new
  end

  def create
  @sale = Sale.new(sale_params)

  respond_to do |format|
      if @sale.save
        format.html {redirect_to sales_path, notice: 'la venta se ha generado'}
        format.json {render :show, status: :created, location: @sales}
      else
        format.html {render :new}
        format.json {reder json: @sales.errors, status: :unprocessable_entity}
      end
    end
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
    @sales = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:total, :cantidad, :efectivo, :cambio, :precio_total)
  end
end
