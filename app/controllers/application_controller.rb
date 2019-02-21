class ApplicationController < ActionController::Base
  before_action :redirect_if_html
  protect_from_forgery with: :null_session

  def redirect_if_html
    render template: 'pages/home' unless params["format"] == "json"
  end
end
