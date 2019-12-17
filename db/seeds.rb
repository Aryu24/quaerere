# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(password: '123456', password_confirmation: '123456', email: 'a@a', nick_name: '†イキリト†', last_name: '桐ヶ谷', first_name: '和人', last_name_read: 'きりがや', first_name_read: 'かずと', phone_number: '0120-117-117', postcode: '155-0031', prefecture_code: '東京都', address_city: '世田谷区', address_street: '北沢３丁目２３−１４', address_building: 'コートファーストステージ' )