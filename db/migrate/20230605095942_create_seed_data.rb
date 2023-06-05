class CreateSeedData < ActiveRecord::Migration[7.0]
  def up
    User.create!(name: 'test', email: 'test@test.com', password: '123456')
    User.create!(name: 'test1', email: 'test1@test.com', password: '123456')

    SharedVideo.create!(user_id: 1, title: 'title 1', url: 'https://youtu.be/44VBVj7n91s?list=RD44VBVj7n91s')
  end
end
