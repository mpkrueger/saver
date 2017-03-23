desc "This task is called by the Heroku scheduler add-on"

task :send_3_day_reminder => :environment do
  puts "Sending 3-day reminder..."

  Ticket.where(has_bill: nil).each do |ticket|
  	if ((Time.now - ticket.created_at) / 1.day).to_i == 3
  		CustomerMailer.bill_reminder(ticket.customer).deliver
  	end
  end

  puts "done."
end

task :send_10_day_reminder => :environment do
  puts "Sending 10-day reminder..."

  Ticket.where(has_bill: nil).each do |ticket|
  	if ((Time.now - ticket.created_at) / 1.day).to_i == 10
  		CustomerMailer.bill_reminder(ticket.customer).deliver
  	end
  end

  puts "done."
end

task :send_17_day_reminder => :environment do
  puts "Sending 17-day reminder..."

  Ticket.where(has_bill: nil).each do |ticket|
  	if ((Time.now - ticket.created_at) / 1.day).to_i == 17
  		CustomerMailer.bill_reminder(ticket.customer).deliver
  	end
  end

  puts "done."
end

task :send_24_day_reminder => :environment do
  puts "Sending 24-day reminder..."

  Ticket.where(has_bill: nil).each do |ticket|
  	if ((Time.now - ticket.created_at) / 1.day).to_i == 24
  		CustomerMailer.bill_reminder(ticket.customer).deliver
  	end
  end

  puts "done."
end

task :send_31_day_reminder => :environment do
  puts "Sending 31-day reminder..."

  Ticket.where(has_bill: nil).each do |ticket|
  	if ((Time.now - ticket.created_at) / 1.day).to_i == 31
  		CustomerMailer.bill_reminder(ticket.customer).deliver
  	end
  end

  puts "done."
end