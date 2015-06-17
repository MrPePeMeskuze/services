class User < ActiveRecord::Base
############################# ВАЛИДАТОРЫ ########################################
# => валидация присутствия логина длинной не более 51 символа и его уникальности
	validates :login, presence: true, length: { maximum: 50 }, uniqueness: true
# => регулярка для проверки введенности корректного e-mail
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# => проверка присутвия адресса почты и соответствия формата мэйла и его уникальности
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
############################# ДЕЙСТВИЯ ДО СОХРАНЕНИЯ ########################################
	before_save { self.email = email.downcase }
	before_save { self.login = login.downcase }

	has_secure_password
	validates :password, length: { minimum: 6 }
	def to_param
    	"#{login}"
  	end
  	before_create :create_remember_token
  	def User.new_remember_token
    	SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

  	private

	  def create_remember_token
	  	self.remember_token = User.encrypt(User.new_remember_token)
	  end
end
