class MainController < ApplicationController
  def index
  	@articles = Article.order("updated_at desc")
  	@response = Response.new

  	
  	@response.name = session[:name] if session[:name]
    @response.email = session[:email] if session[:email]

  end
end
