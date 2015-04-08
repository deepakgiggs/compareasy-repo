class SearchProductsController < ApplicationController
 
  #set the product data and fetch information from multiple sites
  def getProductInfo
    puts "here"
    @output_json = {}
    if params[:search]
      @search = params[:search]
      puts @search
      @output_json = SearchProduct.getProdInfo(@search)
      puts @output_json
    end 

    respond_to do |format|
      format.json { render json: @output_json, status: :ok}
      format.html do
        redirect_to '/'
      end
    end 

  end
  
end
