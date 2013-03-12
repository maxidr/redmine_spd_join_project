# encoding: utf-8
class JoinToProjectController < ApplicationController
  unloadable

  def create
    find_project_by_project_id
    return if current_user.anonymous?
    return if already_member?
    @project.members << Member.new(:role_ids => role_to_subscriptor, :user_id => current_user.id)
    if @project.save
      flash[:notice] = l('spd.project.join.success')
    else
      logger.error "No se pudo agregar como miembro del proyecto (ID:#{@project.id}) al " + 
        "usuario (ID:#{current_user.id}). Errores: #{@project.errors.full_messages}"
      flash[:error] = l('spd.project.join.fail')
    end
    send_notification_to_owner_role
    redirect_to project_path(@project)
  end

  def role_to_subscriptor
    role_id = Setting.plugin_redmine_spd_join_project["role_to_subscriptor"]
    role = Role.find(role_id)
    return [] unless role
    [role.id]
  end

  def already_member?
   if current_user.member_of?(@project)
     flash[:error] = l('spd.project.join.already_member')
     redirect_to project_path(@project)
     return true
   end
   false
  end

  def current_user
    User.current
  end

  def send_notification_to_owner_role
    SpdJoinProjectMailer.new_subscribed_member(current_user, @project).deliver
  end
end
