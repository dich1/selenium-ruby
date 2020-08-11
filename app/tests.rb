#!/usr/bin/env ruby

require 'selenium-webdriver'
require 'nokogiri'
require 'open-uri'

@driver = Selenium::WebDriver.for :firefox
# driver = Selenium::WebDriver.for :chrome

@search_word = ARGV.join
@encode_search_word = URI.encode_www_form_component(@search_word)

@driver.navigate.to "https://prtimes.jp/main/action.php?run=html&page=searchkey&search_word=#{@encode_search_word}"

def results_count
  url = "https://prtimes.jp/main/action.php?run=html&page=searchkey&search_word=#{@encode_search_word}"
  html = open(url)
  doc = Nokogiri::HTML.parse(html)
  doc.xpath("/html/body/main/section/div/div[2]/text()").to_s.split("件")[0].split()[0].to_i
  #件数多過ぎてタイムアウトエラーが発生するので仮で固定値
  100
end

def one_time_count
  40
end

def click_count
  results_count / one_time_count
end

def click_more_button
  wait = ::Selenium::WebDriver::Wait.new(timeout: 60)
  i = 1
  click_count
  while i <= click_count
    @driver.find_element(:xpath, "/html/body/main/section/section/div/div/a").click
    one_time_count_by_click = (i + 1) * one_time_count
    wait.until { @driver.find_element(:xpath, "/html/body/main/section/section/div/article[" + one_time_count_by_click.to_s + "]/a").displayed? }
    i += 1
  end
end

def urls
  click_more_button
  doc = Nokogiri::HTML.parse(@driver.page_source)
  urls = []
  i = 1

  while i <= results_count
    xpath = "/html/body/main/section/section/div/article[" + i.to_s + "]/a"
    urls << "https://prtimes.jp" + doc.xpath(xpath)[0]["href"]
    i += 1
  end
  urls
end

def prefecture_urls
  prefecture_urls = []
  urls.map { |url|   
    html = open(url)
    doc = Nokogiri::HTML.parse(html)
    unless (doc.xpath('//*[@id="containerInformationCompany"]/li[3]/span[2]').select{|s| s.inner_text =~ /#{@search_word}/ }.empty?) 
      puts url
    end
  }
end

prefecture_urls

@driver.quit
