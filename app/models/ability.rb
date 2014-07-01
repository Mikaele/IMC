class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    # user ||= User.new # guest user (not logged in)
     if user
       if user.colaborador
         if user.colaborador.perfil.nome=='Admin'
         can :manage, Call
         can :manage, Ic
         can :manage,Service
         can :manage,Colaborador
         can :manage,Client
         can :manage, Perfil
         can :manage, Category
         can :manage,Incidente
         cannot :create, Client
         cannot :create, Call
         cannot :update, Call

        elsif user.colaborador.perfil.nome=='Tec1'
         can [:read,:escalonar,:resolver,:ja_resolvi,:resolvida_enviar,:abandonar], Call
         can [:index,:read], Ic
         can [:index,:read],Service
         can :read,Colaborador
         can :read,Client
         can [:index,:create,:show],Solution
         can [:index,:create],Incidente

        elsif user.colaborador.perfil.nome=='Tec2'
          can [:read,:escalonar,:resolver,:ja_resolvi,:resolvida_enviar,:abandonar], Call
          can [:index], Ic
          can [:index],Service
          can :index,Colaborador
          can :index,Client
          can [:create,:update,:index],Solution
          can [:create,:update,:index],Incidente

        elsif user.colaborador.perfil.nome=='Tec3'
          can :read, Call
          can :update, Call
          can [:manage], Ic
          can [:manage],Service
          can :index ,Colaborador
          can :index,Client
          can [:create,:update,:index],Solution
          can [:create,:update,:index],Incidente
        end
       else
         if user.client
        can [:create,:meus_cahamados],Call
        can :read,Ic
        can :read,Service
        cannot :index,Call
        end
       end
    end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
