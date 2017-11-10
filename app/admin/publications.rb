ActiveAdmin.register Publication do
  index do
    column :id
    column :title
    column :type
    column :category
    column :region
    column :commune
    column :address
    column :equipments do |publication|
      publication.equipments.collect(&:name).join(', ')
    end
    column :user
  end

  controller do
    def scoped_collection
      Publication.includes(:type, :region, :commune, :user, :category, :equipments, :property_equipments)
    end
  end

  #Filter
  filter :user
  filter :category
  filter :type
  filter :region
  filter :commune
  #filter :title, as: :select -> selecciona los nombres de las publicaciones creadas

  #Form new publication
  permit_params :user, :commune, :region, :category, :type, :title, :bedroom, :bath, :parking, :description, :price, :address, :latitude, :longitude

end
