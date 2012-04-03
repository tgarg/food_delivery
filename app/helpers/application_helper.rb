module ApplicationHelper
  
  # Err...
  # Basically allows for easy (dynamic) manipulation of title on a page by page basis
  
  def full_title(page_title)
    base_title = "Duke Delivery"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
