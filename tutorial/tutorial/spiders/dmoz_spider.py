from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector

from tutorial.items import DmozItem

class DmozSpider(BaseSpider):
   name = "dmoz"
   allowed_domains = ["w3schools.com"]
   start_urls = [

       "http://www.w3schools.com/xsl/xpath_syntax.asp"
   ]

   def parse(self, response):
       hxs = HtmlXPathSelector(response)
       sites = hxs.select("//div[@class='w3-light-grey']")
       items = []


       for site in sites:
           item = DmozItem()
           item['title'] = site.select('a/text()').extract()
           #item['link'] = site.select('h2/a/@href').extract()
           
           items.append(item)
       return items

