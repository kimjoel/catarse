# coding: utf-8

puts 'Seeding the database...'

[
  { pt: 'Astronomia', en: 'Astronomy' },
  { pt: 'Ciencias Biomedicas', en: 'Biomedical Science' },
  { pt: 'Negocios e Gestao', en: 'Business and Management' },
  { pt: 'Quimica', en: 'Chemistry' },
  { pt: 'Clima', en: 'Climate' },
  { pt: 'Ciencia da Computacao', en: 'Computer Science' },
  { pt: 'Ciencias da Terra e Geografia',  en: 'Earth Sciences and Geography' },
  { pt: 'Economia', en: 'Economics' },
  { pt: 'Educacao e Linguagem', en: 'Education and Language' },
  { pt: 'Energia', en: 'Energy' },
  { pt: 'Engenharia', en: 'Engineering' },
  { pt: 'Ciencias Ambientais', en: 'Environmental Sciences' },
  { pt: 'Ciencia e Nutricao Alimentar', en: 'Food Science and Nutrition' },
  { pt: 'Lei', en: 'Law' },
  { pt: 'Ciencias da Vida', en: 'Life Sciences' },
  { pt: 'Materiais', en: 'Materials' },
  { pt: 'Matematica', en: 'Mathematics' },
  { pt: 'Medicina', en: 'Medicine' },
  { pt: 'Filosofia', en: 'Philosophy' },
  { pt: 'Fisica', en: 'Physics' },
  { pt: 'Popular Science', en: 'Popular Science' },
  { pt: 'Psicologia', en: 'Psychology' },
  { pt: 'Saude Publica', en: 'Public Health' },
  { pt: 'Ciencias Sociais', en: 'Social Sciences' },
  { pt: 'Estatistica', en: 'Statistics' },
  { pt: 'Agua', en: 'Water' },
  { pt: 'Logistica', en: 'Logistics'},
].each do |name|
   category = Category.find_or_initialize_by_name_pt name[:pt]
   category.update_attributes({
     name_en: name[:en]
   })
 end

[
  'confirm_backer','payment_slip','project_success','backer_project_successful',
  'backer_project_unsuccessful','project_received', 'project_received_channel', 'updates','project_unsuccessful',
  'project_visible','processing_payment','new_draft_project', 'new_draft_channel', 'project_rejected',
  'pending_backer_project_unsuccessful', 'project_owner_backer_confirmed', 'adm_project_deadline',
  'project_in_wainting_funds', 'credits_warning', 'backer_confirmed_after_project_was_closed',
  'backer_canceled_after_confirmed', 'new_user_registration'
].each do |name|
  NotificationType.find_or_create_by_name name
end

{
  company_name: 'OED',
  host: 'oed.me',
  base_url: "http://oed.me",
  blog_url: "http://blog.oed.me",
  email_contact: 'contact@oed.me',
  email_payments: 'finance@oed.me',
  email_projects: 'project@oed.me',
  email_system: 'system@oed.me',
  email_no_reply: 'no-reply@oed.me',
  facebook_url: "http://facebook.com/oed",
  facebook_app_id: '173747042661491',
  twitter_username: "oed",
  mailchimp_url: "http://catarse.us5.list-manage.com/subscribe/post?u=ebfcd0d16dbb0001a0bea3639&amp;id=149c39709e",
  catarse_fee: '0.13',
  support_forum: 'http://support.oed.me/',
  base_domain: 'oed.me',
  uservoice_secret_gadget: 'change_this',
  uservoice_key: 'uservoice_key'
}.each do |name, value|
   conf = Configuration.find_or_initialize_by_name name
   conf.update_attributes({
     value: value
   }) if conf.new_record?
end


Channel.find_or_create_by_name!(
  name: "Channel name",
  permalink: "sample-permalink",
  description: "Lorem Ipsum"
)


OauthProvider.find_or_create_by_name!(
  name: 'facebook',
  key: '168190143370223',
  secret: 'aeb31d61c3ba7eed0a005ee5ea3277b7',
  path: 'facebook'
)


puts
puts '============================================='
puts ' Showing all Authentication Providers'
puts '---------------------------------------------'

OauthProvider.all.each do |conf|
  a = conf.attributes
  puts "  name #{a['name']}"
  puts "     key: #{a['key']}"
  puts "     secret: #{a['secret']}"
  puts "     path: #{a['path']}"
  puts
end


puts
puts '============================================='
puts ' Showing all entries in Configuration Table...'
puts '---------------------------------------------'

Configuration.all.each do |conf|
  a = conf.attributes
  puts "  #{a['name']}: #{a['value']}"
end

puts '---------------------------------------------'
puts 'Done!'

