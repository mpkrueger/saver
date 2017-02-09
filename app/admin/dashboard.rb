ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content do
    panel "New tickets by week" do
      #  line_chart SaverGuest.group_by_day(:created_at, last: 30).count, xtitle: "Date", ytitle: "Saver Guests"
        column_chart Ticket.group_by_week(:created_at, last:5).count, xtitle:"New Tickets", ytitle: "By Week"
    end

    panel "# of new tickets w/ bills collected by week" do
        column_chart Ticket.group_by_week(:created_at, last:5).where(has_bill: true).count, xtitle:"Bills Collected", ytitle:"By Week"
    end

    panel "Amount earned by week" do
        column_chart Ticket.group_by_week(:created_at, last:5).where(successfully_saved_money: true).sum(:amount_earned), xtitle:"Amount earned", ytitle:"By Week"
    end

    panel "Overall Stats" do
        para "Average saved per bill received: #{ monetize( Ticket.where(has_bill: true).average(:amount_saved) ) }"
        para "Total saved: #{ monetize(Ticket.sum(:amount_saved)) }"
        para "Total earned: #{ monetize(Ticket.sum(:amount_earned))}"
        para "Total bills received: #{ Ticket.where(has_bill: true).count }"
        para "Total bills where we saved more than $100: #{ Ticket.where("amount_saved > ?", 10000).count }"
        para "Average saved per bill received with savings > $100: #{ monetize ( Ticket.where("amount_saved > ?", 10000).sum(:amount_saved) / Ticket.where("amount_saved > ?", 10000).count ) }"
        para "Average saved per bill: #{ monetize ( Ticket.where("amount_saved > ?", 10000).sum(:amount_saved) / Ticket.where(has_bill: true).count ) } "
    end

    # panel "Today's Stats" do
    #     para "New customers added: #{SaverGuest.where("created_at >= ?", Time.zone.now.beginning_of_day).count }"
    #     para "Calls made: #{ Call.where("created_at >= ?", Time.zone.now.beginning_of_day).count }"
    #     para "Amount saved: #{ monetize(Ticket.where("updated_at >= ?", Time.zone.now.beginning_of_day).sum(:amount_saved).round(2)) }"
    #     para "Amount we earned: #{ monetize(Ticket.where("updated_at >= ?", Time.zone.now.beginning_of_day).sum(:amount_earned)) }"
    # end

    # panel "Other Weekly Stats" do
    #     #para "New customers added: #{ SaverGuest.where("created_at >= ?", Date.today.beginning_of_week).count }"
    #     para "Calls made: #{ Call.where("created_at >= ?", Date.today.beginning_of_week).count }"
    #     para "Amount saved: #{ monetize(Ticket.where("updated_at >= ?", Date.today.beginning_of_week).sum(:amount_saved).round(2))}"
    #     para "Amount earned: #{ monetize(Ticket.where("updated_at >= ?", Date.today.beginning_of_week).sum(:amount_earned))}"
    # end

    # panel "March Weekly Goals" do
    #     para "280 new customers added weekly"
    #     para "87 calls made weekly"
    #     para "$2906 earned weekly"
    # end

  end


    # http://chartkick.com/ for more info on charting

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  
end
