class MissingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    all
  end

  # get animals/missings/all
  def all
    @animals = Animal.missing.includes(:user)
    set_view
  end

  # get animals/missings/dogs
  def dogs
    @animals = Animal.missing.dogs.includes(:user)
    set_view
  end

  # get animals/missings/cats
  def cats
    @animals = Animal.missing.cats.includes(:user)
    set_view
  end

  # get animals/missings/other
  def other
    @animals = Animal.missing.other.includes(:user)
    set_view
  end
end
