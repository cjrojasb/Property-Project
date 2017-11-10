ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

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

    columns do
      column do
        panel "Últimas publicaciones creadas" do
          ul do
            Publication.last(5).each do |publication|
              li link_to(publication.title, admin_publication_path(publication))
            end
          end
        end
      end
      column do
        panel "Listado de Usuarios" do
          ul do
            li b "Total Usuarios: #{User.count + AdminUser.count}"
            li i "Administradores registrados: #{AdminUser.count}"
            li i "Usuarios Normales: #{User.where(role: "normal").count}"
            li i "Usuarios Invitados: #{User.where(role: "guest").count}"
          end
        end
      end
    end
  end # content
end
