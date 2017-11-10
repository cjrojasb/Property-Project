ActiveAdmin.register_page "Dashboard" do

  #Charts

  @categories = Category.includes(:publications).group(:name).pluck("categories.name, count('publications')")
  @publications_by_day = Publication.group_by_day(:created_at).count


  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      h1 b "Bienvenido Active Admin"
      hr
      br
    end

    columns do
      panel "Gráficos" do
        render 'shared/admin/charts_publications'
      end
    end




    columns do
      column do
        panel "Últimas publicaciones creadas" do
          columns do
            column do
              ul do
                Publication.last(5).each do |publication|
                  li link_to(publication.title, admin_publication_path(publication))
                end
              end
            end
            column do
              
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
    columns do
      column do
        panel "Gráficos" do
          render 'shared/admin/charts'
        end
      end
      column do
      end
    end
  end # content
end
