module ApplicationHelper

  # Returns the full title on a per-page basis
  BASE_TITLE = "Ruby on Rails Tutorial"

  def full_title(page_title)
    if !page_title.empty?
      "#{BASE_TITLE} | #{page_title}"
    else
      BASE_TITLE
    end
  end
end
