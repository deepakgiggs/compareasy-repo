class SearchProduct < ActiveRecord::Base

  def self.getProdInfo(query)
  	query = query.gsub! /\s+/, '+'
  	JSON.load(
  		open("https://affiliate-api.flipkart.net/affiliate/search/json?query=#{query}&resultCount=1",
  			"Fk-Affiliate-Id" => AppConstants::CEASY_FLIPKART_AFF_ID,
  			"Fk-Affiliate-Token" => AppConstants::CEASY_FLIPKART_AFF_TOKEN
  		))
  end	

end
