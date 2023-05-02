FactoryBot.create(:user, email: 'ola@marcuspereira.dev', password: '1263981')
FactoryBot.create_list(:post, 3, :with_resources)
