# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  #def edit
  #  super
  #end

  # PUT /resource
  # def update
  #   super do |format|
  #     #we only update usernames on posts and comments if the changes done are valid (username is unique)
  #     # if @user.valid?
  #     #   @posts = current_user.posts

  #     #   #updating username of each post (just incase user has changed their name)
  #     #   @posts.each do |post|
  #     #     #need to use @user here instead of current_user
  #     #     #this is because current_user.username (and other details) only gets updated once the edit form is submitted
  #     #     post.update_username(@user.name)
  #     #   end

  #     #   @comments = current_user.comments

  #     #   #also updating username on each comment
  #     #   @comments.each do |comment|
  #     #     comment.update_username(@user.name)
  #     #   end

  #     #   #we must redirect to override the default redirect defined in super
  #     #   #otherwise our post and comment records will not update in db
  #     #   redirect_to root_path and return if resource.valid?
  #     # end
  #   end
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
