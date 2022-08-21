class WelcomeController < ApplicationController
  def show
    render json: {message: 'Welcome to the API, here you can create and list transactions'}
  end
end
