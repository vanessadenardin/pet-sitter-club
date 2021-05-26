# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    alias_action :index, :to => :look
    can :look, Service
    can :read, User

    return unless user

    can :edit, User, id: user.id
    can :read, Order, client_id: user.id
    can :read, Order, pet_sitter_id: user.id
    can :create, Order if user.client?

    if user.pet_sitter?
      can :edit, Order, pet_sitter_id: user.id
      can :edit, OrderService
      can :manage, PetSitterService, pet_sitter_id: user.id
      can :complete_order_service, Order, pet_sitter_id: user.id
    elsif user.client?
      can :manage, Pet, client_id: user.id
      can :edit, Order, client_id: user.id
    end

    return unless user.admin?
    
    can :manage, :all

    # Define abilities for the passed in user here. For example:
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
