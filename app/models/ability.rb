# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    return unless user
    if user.role == CONFIG["admin"]
      can :access, :rails_admin   # grant access to rails_admin
      can :read, :dashboard

      can [:read, :update], Setting
      can [:read, :update, :destroy], User
      cannot :destroy, User, id: user.id
    elsif user.role == CONFIG["company"]
      can :access, :rails_admin   # grant access to rails_admin
      can :read, :dashboard

      can :profile, :home
      can :update, User, id: user.id
      can :show_in_app, JobAd, user_id: user.id
      can :manage, JobAd, user_id: user.id
      can [:read, :update], Applicant, company_id: user.id
    elsif user.role == CONFIG["user"]
      can :access, :rails_admin   # grant access to rails_admin
      can :read, :dashboard

      can [:profile, :apply_page, :apply], :home
      can :update, User, id: user.id
      can :show_in_app, Profile, user_id: user.id
      can [:read, :update], Profile, user_id: user.id
      can :manage, [Education, Experience], profile: user.profiles.first.id
      can :read, Applicant, user_id: user.id
    else
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
