module OntapsHelper
	def striphtml(text)
		filtered = text.gsub(/\<.*?\>/, "")
		nbspfiltered = filtered.gsub("&nbsp;", "")
		rsquofiltered = filtered.gsub("&rsquo;", "'")
		return rsquofiltered
	end
end
