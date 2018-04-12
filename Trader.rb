#!/usr/bin/env ruby
require 'rubygems'
require "nokogiri"
require "open-uri"

def cryptocurrency
	cryptomonnaies = []
	doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
	doc.css("a.currency-name-container").each_with_index do | l, x | 
	# avec index : je met en proportionnalité la valeur de la monnaie avec le cours du prix (valeur de référence)
	# l'élement (l) prend la valeur de nom de monnaies
	# l'élement (x) prend la valeur du prix
	puts l.text
	puts x[data-btc]


	cryptomonnaies[x] = Hash.new(0)
	cryptomonnaies[x][l.text] = doc.css("a.price")[0].text
	puts cryptomonnaies[x]
	end
	p cryptomonnaies
end
cryptocurrency
