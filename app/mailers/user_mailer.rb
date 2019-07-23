class UserMailer < ApplicationMailer
	def new_chapter(user)
    @users = User.all
    @users.each do |user|
    	mail(to: user.email, subject: 'There is a new chapter')
    end
  end
end
