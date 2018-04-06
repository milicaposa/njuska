class PagesController < ApplicationController
  # dont do authentication for these actions
  before_action :authenticate_user!, except: [:about, :news]

  def about
  end

  def news
    @tweets = SocialTool.animal_search
  end
end