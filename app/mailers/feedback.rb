class Feedback < ActionMailer::Base
  default from: "predatorqwerty2@gmail.com", to: "predatorqwerty2@gmail.com"
  	def contact(fio, email, phone, body)
        @fio = fio
        @email = email
        @phone = phone
        @body = body

        mail(from: email, subject: 'Contact Request')
    end
end
