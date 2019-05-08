# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)
Trouble.destroy_all
t = Trouble.create!(name: 'OAC')
Role.destroy_all
r = Role.create!(name: 'Gerente')
Core.destroy_all
c = Core.create!(name: 'NUT')
User.destroy_all
u1 = User.create!(name: 'Icaro Rezende', email: 'icarorezende@cjr.org.br', password: 'admin123', admin: false, role_id: r.id, core_id: c.id, active: true)
u2 = User.create!(name: 'Vitor Ribas', email: 'vitorbandeira@cjr.org.br', password: 'admin123', admin: false, role_id: r.id, core_id: c.id, active: true)
UserTrouble.destroy_all
UserTrouble.create!(user_id: u1.id, trouble_id: t.id)
UserTrouble.create!(user_id: u2.id, trouble_id: t.id)
Step.destroy_all
s1 = Step.create!(name: "Apresentação")
s2 = Step.create!(name: "Contato")
Customer.destroy_all
ct = Customer.create!(name: 'Bruno Lopes', email: 'vasila1@vasilo.com', phone: '123456789')
Tag.destroy_all
t1 = Tag.create!(name: 'Empresa')
Deal.destroy_all
d1 = Deal.create!(customer_id: ct.id, name: 'proaDHO', description: 'Rogue', primary_seller_id: u1.id, secondary_seller_id: u2.id, start_date: '2019-01-10', active: true, done: false, price: 8.88)

5000.times do |i|
    Customer.create(name: "Tiago #{i}", email: "tiago#{i}@tiagao.taigo", phone: "6199999-999#{i}")
end