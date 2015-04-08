class SearchProduct < ActiveRecord::Base

  def self.getProductInfo(query)
  	product_output = {}
  	flipkart_data = getFlipkartProdInfo(query)
  	product_output = {'flipkart' => flipkart_data}

  	return product_output
  end


  def self.getFlipkartInfoOnDemand(query)
  	flipkart_refined_output = {}
  	flipkart_output_array = []
  	flipkart_multiple_outputs = []
  	query = query.gsub! /\s+/, '+'
  	flipkart_output = JSON.load(
  		open("https://affiliate-api.flipkart.net/affiliate/search/json?query=#{query}&resultCount=10",
  			"Fk-Affiliate-Id" => AppConstants::CEASY_FLIPKART_AFF_ID,
  			"Fk-Affiliate-Token" => AppConstants::CEASY_FLIPKART_AFF_TOKEN
  		))

  	flipkart_output['productInfoList'].each do |prod|
  		product_owner = 'flipkart'
  		product_id = prod['productBaseInfo']['productIdentifier']['productId']
	    product_title = prod['productBaseInfo']['productAttributes']['title']
	    product_category = prod['productBaseInfo']['productIdentifier']['categoryPaths']['categoryPath'][0]
	    product_categories = []
	    product_category.each do |prod_cat|
          product_categories.push(prod_cat['title'])
	    end
	    
		product_description = prod['productBaseInfo']['productAttributes']['productDescription']
		#lets take 200x200 image, there are other sizes too.
        if prod['productBaseInfo']['productAttributes']['imageUrls'].has_key?('200x200')
	      product_image = prod['productBaseInfo']['productAttributes']['imageUrls']['200x200']
		else
		  product_image = prod['productBaseInfo']['productAttributes']['imageUrls'].values.first
	    end
       
        retail_price = prod['productBaseInfo']['productAttributes']['maximumRetailPrice']['amount']
		selling_price = prod['productBaseInfo']['productAttributes']['sellingPrice']['amount']
		product_url = prod['productBaseInfo']['productAttributes']['productUrl']
		product_brand = prod['productBaseInfo']['productAttributes']['productBrand']
		product_color = prod['productBaseInfo']['productAttributes']['color']
        
        #hash for one product
        flipkart_refined_output = {:product_id => product_id, :product_title => product_title,
        							:product_description => product_description, :product_image => product_image,
        							:product_retail_price => retail_price, :product_selling_price => selling_price,
        							:product_url => product_url, :product_brand => product_brand, 
        							:product_color => product_color, :product_owner => product_owner,
                                    :product_categories => product_categories
                                   }
        
         
        @search_data =  SearchProduct.where(:product_id => product_id).first
        if @search_data
          @search_data.update_attributes(flipkart_refined_output)
        else
          flipkart_output_array.push(flipkart_refined_output)
        end  
        #@search_data = SearchProduct.first_or_create(:product_id => product_id)

        #SearchProduct.first_or_create(:product_id => product_id).
		#@search_data = SearchProduct.new(flipkart_refined_output)
		flipkart_multiple_outputs.push(flipkart_refined_output)
  	end
  	#store multiple product hashes in a single save
    SearchProduct.create(flipkart_output_array)
    #flipkart_multiple_outputs['flipkart'] = flipkart_output_array
    return flipkart_multiple_outputs
  end



  def self.getFlipkartProdInfo(query)
  	full_query = query
  	full_query = full_query.gsub(/\s+/, '%')
    conditions = "product_title LIKE #{sanitize("%#{full_query}%")}"
    
    data = self.where(conditions)
    
    if not data.any?
      puts "************"
      terms = query.split(' ') # split the string on each space
      conditions = terms.map{ |term| "product_title LIKE #{sanitize("%#{term}%")}" }.join(' OR ') 
    
      data = self.where(conditions)

      if data.any?
        flipkart_data = data
      else
        flipkart_data = getFlipkartInfoOnDemand(query)
      end
    else
      flipkart_data = data    
    end 
  
    return flipkart_data            
  end	


end
