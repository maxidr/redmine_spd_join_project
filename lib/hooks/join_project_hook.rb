module RedmineSpdJoinProject
  class JoinProjectHookListener < Redmine::Hook::ViewListener

    #def view_layouts_base_sidebar(context = {})
    def view_projects_show_sidebar_bottom(context = {})
      return nil if should_not_show_join?(context)
      content_tag("h3", "Acciones") +
      link_to("Unirse al proyecto", join_to_project_path(context[:project]), 
              :class => 'icon icon-add', :method => :post)
    end

    def should_not_show_join?(context)
      # El usuario debe estar autenticado
      project = context[:project]
      project.nil? or current_user.member_of?(project) or current_user.anonymous?
    end

    def current_user
      User.current
    end

  end
end
