#coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
default_avatar = 'http://localhost:3000/blank_user.jpg'

@ramdoms = ['ramdom@gmail.com','c.fella@gmail.com','juju.bees@gmail.com']

def generate_avatar_url(index)
  "http://www.avatarpro.biz/avatar/#{Digest::MD5.hexdigest(@ramdoms[index])}"
end

#Skill Levels
youngling = SkillLevel.create({label: 'Youngling'})
padawan = SkillLevel.create({label: 'Padawan'})
jedi_knight = SkillLevel.create({label: 'Jedi Knight'})
jedi_master = SkillLevel.create({label: 'Jedi Master'})

#Notification Levels
notf_none = NotificationLevel.create({label: 'None'})
notf_email = NotificationLevel.create({label: 'Email'})
notf_push = NotificationLevel.create({label: 'Push'})
notf_email_push = NotificationLevel.create({label: 'Email + Push'})

#Users
isaac = User.create({name: 'Isaac Newton', email: 'isaac@railsnapraia.com', provider_image_url: default_avatar, skill_level: jedi_master})
rafael = User.create({name: 'Rafael Magalhães', email: 'r.santos2507@gmail.com', provider_image_url: default_avatar, skill_level: jedi_master})
ramdom_01 = User.create({name: 'Mr. Ramdom', email: @ramdoms[0] , provider_image_url: generate_avatar_url(0), skill_level: youngling})
ramdom_02 = User.create({name: 'Crazy Fella', email: @ramdoms[1] , provider_image_url: generate_avatar_url(1), skill_level: youngling})
ramdom_03 = User.create({name: 'Jujubees', email: @ramdoms[2] , provider_image_url: generate_avatar_url(2), skill_level: youngling})

#Questions
question_01 = Question.create({user: rafael, title: 'Pergunta teste 01', content: 'Conteúdo pergunta teste 01', hits: 1})
question_02 = Question.create({user: ramdom_01, title: 'Pergunta teste 02', content: 'Conteúdo pergunta teste 02', hits: 2})
question_03 = Question.create({user: ramdom_02, title: 'Pergunta teste 03', content: 'Conteúdo pergunta teste 03', hits: 3})
question_04 = Question.create({user: ramdom_03, title: 'Pergunta teste 04', content: 'Conteúdo pergunta teste 04', hits: 4})

#Answers
answer_01 = Answer.create({user: isaac, question: question_01, content: 'Conteúdo resposta 01'})
answer_02 = Answer.create({user: rafael, question: question_01, content: 'Conteúdo resposta 02'})
answer_03 = Answer.create({user: ramdom_02, question: question_01, content: 'Conteúdo resposta 03'})
answer_04 = Answer.create({user: ramdom_03, question: question_01, content: 'Conteúdo resposta 04'})

#Votes
vote_01 = Vote.create({user: rafael, answer: answer_01, up: true})