module ApplicationHelper
	def striphtml(text)
		filtered = text.gsub(/\<.*?\>/, "")
		nbspfiltered = filtered.gsub("&nbsp;", "")
		return nbspfiltered
	end
	
	def url_with_protocol(url)
    	/^http/i.match(url) ? url : "http://#{url}"
  	end
end
