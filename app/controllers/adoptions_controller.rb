class AdoptionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    all
  end

  # get animals/adoptions/all
  def all
    @animals = Animal.adoption.includes(:user)
    set_view
  end

  # get animals/adoptions/dogs
  def dogs
    @animals = Animal.adoption.dogs.includes(:user)
    set_view
  end

  # get animals/adoptions/cats
  def cats
    @animals = Animal.adoption.cats.includes(:user)
    set_view
  end

  # get animals/adoptions/other
  def other
    @animals = Animal.adoption.other.includes(:user)
    set_view
  end
end
