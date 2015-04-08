class SearchProductsController < ApplicationController
 
  #set the product data and fetch information from multiple sites
  def getProductInfo
    puts "here"
    @output_json = {}
    if params[:search]
      @search = params[:search]
      puts @search
      @output_json = SearchProduct.getFlipkartProdInfo(@search)
      puts @output_json
    end
    respond_to do |format|
      format.json { render :json => @output_json, status: :accepted }
    end
  end

  def showSearch
    render "search_products/getInfo", :layout => "search"    
  end
  
  #private
  #def search_params
  #  params.require(:searchproduct).permit(:product_id, :product_title, :product_url, :product_image, :product_retail_price,
 #                                         :product_selling_price, :product_brand, :product_color, :product_description)
 # end

end
