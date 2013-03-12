#class RedmineSpdJoinProject::Mailer < Mailer
class SpdJoinProjectMailer < Mailer
  
  def new_subscribed_member(user, project)
    @user = user
    @project = project
    mail :to => mail_to(project),
      :subject => "El usuario #{user.name} se ha suscrito al projecto #{project.name}"
  end

  def mail_to(project)
    mails = Set.new
    users_by_role = project.users_by_role
    roles_to_send.each do |rol|
      #mails += users_by_role[rol].map { |u| u.mail }
      users = users_by_role[rol]
      mails += users.map { |u| u.mail } if users
    end
    mails.to_a.join(", ")
  end

  def roles_to_send
    ids = Setting.plugin_redmine_spd_join_project["project_manager_roles"]
    Role.where(:id => ids)
  end

end
