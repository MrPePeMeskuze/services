class StaticPagesController < ApplicationController

  def home
  	@services = Services.where(parent_id: 0).where(is_published: 1).order(:is_published).order(:position).limit(3)
  end

  def about
  end

  def contacts
  end

  def news
  end

  def portfolio
  end

  def services
  	@services = Services.where(parent_id: 0).where(is_published: 1).order(:is_published).order(:position)
  end

  def sendmail
    if params[:email].empty? or params[:fio].empty? or params[:body].empty?
      flash[:error] = "Не все поля заполненны!"
      redirect_to :back
    else
      fio = params[:fio]
      email = params[:email]
      phone = params[:phone]
      body = params[:body]
      Feedback.contact(fio, email, phone, body).deliver
      flash[:success] = "Сообщение успешно отправлено!"
      redirect_to contacts_path
    end
  end
  
end
