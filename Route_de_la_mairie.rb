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
#get_the_email_of_a_townhal_from_its_webpage


def get_all_the_urls_of_val_doise_townhalls
	doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	doc.css("td a.lientxt").each do |element|
	puts element.text
	puts "http://annuaire-des-mairies.com" + element["href"]
	end
end


def get_email_corp(page_url)
	administration = Hash.new
	doc = Nokogiri::HTML(open(page_url))
	doc.css("td a.lientxt").each do |element|
		ville = element.text.capitalize
		doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com" + element["href"]))
		lien = doc.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
		tel = doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[2]/td[2]').text
		puts administration = { "nom_de_la_ville" => ville, "email" => lien, "Numéro de téléphone de la mairie"=>tel }

	end
end


#get_email_corp("http://annuaire-des-mairies.com/val-d-oise.html")


def equipeligue1
	tabname = []
	tabpoint = []
	doc = Nokogiri::HTML(open('https://www.lequipe.fr/Football/ligue-1-classement.html'))
		doc.css("a strong").each do |element|
			tabname << element.text
		end
		doc.css("td.points").each do |nbre|
			tabpoint << nbre.text
		end
		puts tabname.length
		for x in 0..tabname.length-1
			ligue1 = { "equipe" => tabname[x], "points" => tabpoint[x]}
		end
		puts ligue1
end

equipeligue1





=begin
puts "annuaire"
get_all_the_urls_of_val_doise_townhalls
# doc.css affiche tt les (a.lientxt) et avec puts j'affiches tt les elemnets[href]qui me donne les urls.
#essais sur github.
=end