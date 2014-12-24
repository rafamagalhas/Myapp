#coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
default_avatar = 'http://localhost:3000/blank_user.jpg'

isaac = User.create({name: 'Isaac Newton', email:'isaac@railsnapraia.com', image_url: default_avatar})
rafael = User.create({name: 'Rafael Magalhães', email: 'r.santos2507@gmail.com', image_url: default_avatar})

question01 = Question.create({user: rafael, title: 'Pergunta teste 01', content: 'Conteúdo pergunta teste 01', hits: 1})
question02 = Question.create({user: rafael, title: 'Pergunta teste 02', content: 'Conteúdo pergunta teste 02', hits: 1})
question03 = Question.create({user: rafael, title: 'Pergunta teste 03', content: 'Conteúdo pergunta teste 03', hits: 1})
question04 = Question.create({user: rafael, title: 'Pergunta teste 04', content: 'Conteúdo pergunta teste 04', hits: 1})

answer01 = Answer.create({user: isaac, question: question01, content: 'Conteúdo resposta 01'})

vote01 = Vote.create({user: rafael, answer: answer01, up: true})