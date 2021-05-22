# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User, id: user.id
    can :read, Order, client_id: current_user.id
    can :read, Order, pet_sitter_id: current_user.id

    # can :update, Profile, id: current_user.id
    # can :update, Service, pet_sitter_id: current_user.id
    # can :manage, :all

    # Define abilities for the passed in user here. For example:
    # if user.pet_sitter?
    #   can :read, Order, pet_sitter_id: current_user.id
    # elsif user.client?
    #   can :read, Order, client_id: current_user.id
    # elsif user.admin?
    #   can :manage, :all
    # end
      # user ||= User.new # guest user (not logged in)
      # if user.admin?
      #   can :manage, :all
      # else
      #   can :read, :all
      # end

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

  # def admin?
  #   has_role?(:admin)
  # end
  
  # def client?
  #   has_role?(:client)
  # end 

  # def pet_sitter?
  #   has_role?(:pet_sitter)
  # end 
end
