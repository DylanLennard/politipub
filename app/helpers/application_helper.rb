module ApplicationHelper
	def striphtml(text)
		filtered = text.gsub(/\<.*?\>/, "")
		nbspfiltered = filtered.gsub("&nbsp;", "")
		rsquofiltered = filtered.gsub("&rsquo;", "'")
		return rsquofiltered
	end
	
	def url_with_protocol(url)
    	/^http/i.match(url) ? url : "http://#{url}"
  	end
end
