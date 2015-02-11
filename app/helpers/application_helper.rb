module ApplicationHelper
  def nav_menu
    links = "<li>#{link_to('Home ', root_path)}</li>"
    
    

    if @current_user.present?
      group = Group.find_by :name => @current_user.name

      # if @current_user.is_admin
      # links += "<li>#{link_to('All users', users_path)}</li>"
      # end
      links += "<li>#{link_to('My groups ', groups_path)}</li>"
      links += "<li>#{link_to('My personal snippets ', snippets_path)}</li>"
      links += "<li>#{link_to('New group ', new_group_path)}</li>"
      if group.is_personal
        links += "<li>#{link_to('New snippet ', add_group_snippet_path(group.id))}</li>"
      end
      links += "<li>#{link_to('Sign out '+ @current_user.name, login_path, :method => :delete)}</li>"
    else
      links += "<li>#{ link_to('Sign up', new_user_path) }</li><li>#{ link_to('Log in', login_path) }</li>"
    end
    links
  end
end