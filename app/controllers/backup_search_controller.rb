class SearchProductsController < ApplicationController
  before_action :set_search_product, only: [:show, :edit, :update, :destroy]

  # GET /search_products
  # GET /search_products.json
  def index
    @search_products = SearchProduct.all
  end

  # GET /search_products/1
  # GET /search_products/1.json
  def show
  end

  # GET /search_products/new
  def new
    @search_product = SearchProduct.new
  end

  # GET /search_products/1/edit
  def edit
  end

  # POST /search_products
  # POST /search_products.json
  def create
    @search_product = SearchProduct.new(search_product_params)

    respond_to do |format|
      if @search_product.save
        format.html { redirect_to @search_product, notice: 'Search product was successfully created.' }
        format.json { render :show, status: :created, location: @search_product }
      else
        format.html { render :new }
        format.json { render json: @search_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_products/1
  # PATCH/PUT /search_products/1.json
  def update
    respond_to do |format|
      if @search_product.update(search_product_params)
        format.html { redirect_to @search_product, notice: 'Search product was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_product }
      else
        format.html { render :edit }
        format.json { render json: @search_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_products/1
  # DELETE /search_products/1.json
  def destroy
    @search_product.destroy
    respond_to do |format|
      format.html { redirect_to search_products_url, notice: 'Search product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_product
      @search_product = SearchProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_product_params
      params.require(:search_product).permit(:product_id, :product_title, :product_site, :product_image, :product_link, :product_price, :product_discount, :product_details)
    end
end
