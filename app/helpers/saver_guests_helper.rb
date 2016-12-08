module SaverGuestsHelper
	def projected_savings
		if(@saver_guest.last_moved == 'more than a year ago' && @saver_guest.negotiated == "no")
			if(@saver_guest.services['phone']=='1' && @saver_guest.services['internet']=='1' && @saver_guest.services['cable']=='1')
				"$500"
			else
				"$300"
			end
		else
			"–"
		end
	end
end
