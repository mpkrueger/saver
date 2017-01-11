ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content do
    panel "Saver Guests created over time" do
        line_chart SaverGuest.group_by_day(:created_at, last: 30).count, xtitle: "Date", ytitle: "Saver Guests"
    end
    panel "Overall Stats" do
        para "Average saved: #{ monetize(Ticket.average(:amount_saved).round(2)) }"
        para "Total saved: #{ monetize(Ticket.sum(:amount_saved)) }"
        para "Total earned: #{ monetize(Ticket.sum(:amount_earned))}"
    end

    panel "Today's Stats" do
        para "Amount saved: #{ monetize(Ticket.where("updated_at >= ?", Time.zone.now.beginning_of_day).sum(:amount_saved).round(2)) }"
        para "Amount we earned: #{ monetize(Ticket.where("updated_at >= ?", Time.zone.now.beginning_of_day).sum(:amount_earned)) }"
        para "New customers added: #{SaverGuest.where("created_at >= ?", Time.zone.now.beginning_of_day).count }"
        para "Calls made: #{ Call.where("created_at >= ?", Time.zone.now.beginning_of_day).count }"
    end

    panel "Weekly Stats" do
        para "New customers added: #{ SaverGuest.where("created_at >= ?", Date.today.beginning_of_week).count }"
        para "Calls made: #{ Call.where("created_at >= ?", Date.today.beginning_of_week) }"
        para "Amount earned: #{ monetize(Ticket.where("updated_at >= ?", Date.today.beginning_of_week).sum(:amount_earned))}"
    end

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
