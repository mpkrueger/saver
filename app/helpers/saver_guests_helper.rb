module SaverGuestsHelper
	def projected_savings
		if(@saver_guest.last_moved == 'More than a year ago')
			if(@saver_guest.services['phone']=='1' && @saver_guest.services['internet']=='1' && @saver_guest.services['cable']=='1')
				"$500/year"
			else
				"$300/year"
			end
		else
			"-"
		end
	end
end
