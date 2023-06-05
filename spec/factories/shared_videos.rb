FactoryBot.define do
  factory :shared_video do
  	association :user, factory: :user
  	title { 'username' }
  	url { 'https://youtu.be/AnMhdn0wJ4I?list=RDtk36ovCMsU8' }
  end
end
