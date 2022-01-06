# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end


  panel "Ordenes Recientes(10)" do
    table_for Order.order(created_at: :desc).limit(10) do
      column :id
      column 'Colaborador' do |u|
        u.user.name + ' ' + u.user.last_name
      end
      column "Pedido", :cart_id
      column "Estado", :status
      column "Pagado", :paid
      column "Fecha", :created_at
    end
    strong {link_to "Ver Todas las Ordenes",  admin_ordenes_path}
  end

  end # content
end
