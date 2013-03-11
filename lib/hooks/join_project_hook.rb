module RedmineSpdJoinProject
  class JoinProjectHookListener < Redmine::Hook::ViewListener

    def view_layouts_base_sidebar(context = {})
      return "" if should_not_show_join?(context)
      content_tag("h3", "Acciones") +
      link_to("Unirse al proyecto", "http://www.google.com.ar", :class => 'icon icon-add')
    end

    def should_not_show_join?(context)
      project = context[:project]
      project.nil? or current_user.member_of?(project)
    end

    def current_user
      User.current
    end

  end
end
