#class RedmineSpdJoinProject::Mailer < Mailer
class SpdJoinProjectMailer < Mailer
  
  def new_subscribed_member(user, project)
    @user = user
    @project = project
    mail :to => mail_to(project),
      :subject => "El usuario #{user.name} se ha suscrito al projecto #{project.name}"
  end

  def mail_to(project)
    users_by_role = project.users_by_role
    roles_to_send.map do |rol|
      users_by_role[rol].mail
    end
  end

  # TODO Los roles deben ser configurables 
  def roles_to_send
    Role.where("name LIKE ?", 'Jefe de projecto')
  end

end
