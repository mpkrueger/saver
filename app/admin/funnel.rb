ActiveAdmin.register_page "Funnel" do
  content do
    column_chart [["Created account", SaverGuest.count], ["Uploaded bill", Ticket.where(has_bill: true).count], ["Paid", Ticket.where(has_paid: true).count], ["Gave referral", Ticket.where(has_referred: true).count]]
  end
end