module RedmineSpdJoinProject
  class JoinProjectHookListener < Redmine::Hook::ViewListener

    def view_layouts_base_html_head(context={})
      javascript_include_tag('chosen.jquery.js', :plugin => 'redmine_spd_join_project') +
      stylesheet_link_tag('chosen.css', :plugin => 'redmine_spd_join_project') 
    end

    render_on :view_projects_show_sidebar_bottom, :partial => 'join_to_project/sidebar'

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
