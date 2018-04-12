#!/usr/bin/env ruby
require 'rubygems'
require "nokogiri"
require "open-uri"

def cryptocurrency

	doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

	doc.css("a.currency-name-container").each do |l, x| 
# l'élement (l) prend la valeur de nom de monnaies
# l'élement (x) prend la valeur 


		cryptomonnaies[x] = Hash.new(0)
		cryptomonnaies[x][l.text] = doc.css("a.price")[x].text
		puts cryptomonnaies[x]

end

end


cryptocurrency
