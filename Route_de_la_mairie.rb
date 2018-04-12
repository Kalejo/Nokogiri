#!/usr/bin/env ruby

require 'rubygems'
require "nokogiri"
require "open-uri"


def get_the_email_of_a_townhal_from_its_webpage
	doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))
	puts doc.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end
#xpath plus simple et plus court que css
# le .text permet de gagner une ligne de code. D'enlever le puts "element"
get_the_email_of_a_townhal_from_its_webpage


def get_all_the_urls_of_val_doise_townhalls
	doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	doc.css("td a.lientxt").each do |element|
	puts element.text
	puts element["href"]
	end
end
puts "annuaire"
get_all_the_urls_of_val_doise_townhalls
# doc.css affiche tt les (a.lientxt) et avec puts j'affiches tt les elemnets[href]qui me donne les urls.
