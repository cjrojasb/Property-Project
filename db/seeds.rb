# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Type.destroy_all
Commune.destroy_all
Region.destroy_all
Equipment.destroy_all


# Category
Category.create([{name: 'Arrendar'}, {name: 'Vender'}])

# Type
Type.create([{name: 'Casa'}, {name: 'Cabaña'}, {name: 'Departamento'}, {name: 'Oficina'}, {name: 'Terreno'}])

# Equipment
Equipment.create([{name: 'Terraza'}, {name: 'Quincho'}, {name: 'Cocina Americana'}, {name: 'Bodega'}, {name: 'Piscina'}, 
  {name: 'Aire Acondicionado'}, {name: 'Gimnasio'}, {name: 'Calefacción'}])

# Region
# Region.create([{name: 'Región de Los Ríos'}, {name: 'Región Metropolitana'}, {name: 'Región de Magallanes y la Antártica Chilena'}, {name: 'Región del Bío-Bío'}, 
#   {name: 'Región de Los Lagos'}])

r1 = Region.create(name: 'Región de Los Ríos')
r2 = Region.create(name: 'Región Metropolitana')
r3 = Region.create(name: 'Región de Magallanes y la Antártica Chilena')
r4 = Region.create(name: 'Región de Los Ríos')
r5 = Region.create(name: 'Región del Bío-Bío')
r6 = Region.create(name: 'Región de Valparaiso')

# Commune
Commune.create([{name: 'Arica', region_id: r1.id}, {name: 'Macul', region_id: r2.id}, {name: 'Quilpué', region_id: r4.id}, 
  {name: 'Viña del Mar', region_id: r6.id}, {name: 'La Reina', region_id: r2.id}])
