ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    column :id
    column :name
    column :phone
    column :email
    column :role
    column :created_at
    actions
  end

  #filter :phone, as: :check_boxes

  filter :name, as: :select
  filter :phone
  filter :email
  filter :role

  permit_params :name, :phone, :email, :role, :password

  form do |f|
    inputs "Agregar nuevo Usuario" do
      input :name
      input :phone
      input :email
      input :role
      input :password
    end
    actions
  end

  controller do
    def update
      if (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
    super
    end
  end

end
