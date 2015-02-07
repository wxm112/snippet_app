module ApplicationHelper
  def nav_menu
    links = "<li>#{link_to('Home ', root_path)}</li>"
  end
end
