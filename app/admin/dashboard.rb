ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content do
    panel "Saver Guests created over time" do
        line_chart SaverGuest.group_by_day(:created_at, last: 30).count, xtitle: "Date", ytitle: "Saver Guests"
    end
    panel "Average Savings" do
        para "Average saved: #{Ticket.average(:amount_saved)}"
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
