module ArticlesHelper

	def striphtml(text)
		text.gsub(/\<.*?\>/, "")
	end

end
