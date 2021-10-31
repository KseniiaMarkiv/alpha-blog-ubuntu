class PagesController < ApplicationController
  def home
    # render html: 'Hello World!'  - it's how you can check work of CTRL
    redirect_to articles_path if logged_in?
  end  
  def about
  end
end
