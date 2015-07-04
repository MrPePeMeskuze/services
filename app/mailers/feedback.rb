class Feedback < ActionMailer::Base

  	def contact(fio, email, phone, body)
        @fio = fio
        @email = email
        @phone = phone
        @body = body
        mail :to => 'antipovstroy@gmail.com', :from => email, :subject => "Письмо с сайта" 
    end
end
