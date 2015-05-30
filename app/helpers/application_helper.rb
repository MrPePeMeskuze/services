module ApplicationHelper

  def full_title(page_title)
    standart_title = "Услуги строительства. Сопутствующие товары."
    if page_title.empty?
      standart_title
    else
      "#{page_title}"
    end
  end
end
