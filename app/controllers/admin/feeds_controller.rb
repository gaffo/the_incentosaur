class Admin::FeedsController < Admin::AdminBaseController
	active_scaffold :feed do |config|
	end
	
	def show
		@record = Feed.find(params[:id])
		doc = REXML::Document.new(Net::HTTP.get_response(URI.parse(@record.url)).body)
		
		ids = []
		authors = []
		
		doc.elements.each(@record.id_xpath){|e| ids << e.text}
		doc.elements.each(@record.author_xpath){|a| authors << a.text}
		
		@values = []
		for i in 0..(ids.size - 1)
			@values[i] = {:id => ids[i], :author => authors[i]}
		end
	end
end
