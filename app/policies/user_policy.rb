class UserPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      # scope
      if user.admin?
        scope.all
      else

        scope.where(:id => user.id)
      end

    end
  end

  def show?
    # scope.where(:id => record.id).exists? unless user.admin?
    # true
    user.id == record.id || user.admin?
  end

  def update?
    user.admin?
  end


  def destroy?
     user.admin?
  end


  def permitted_attributes
    if user.admin?
      [:access_level]
    else
      []
    end
  end



end
