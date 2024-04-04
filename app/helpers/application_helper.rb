module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = "")
    base_title = "Ruby of Rails Tutorial Sample App"
    if page_title.empty?
      base_title
      #now even if we dont have <% provide(:title, "About") %> base_title will be shown
    else
      "#{page_title} | #{base_title}"
    end
  end
end
