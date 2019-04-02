class ApplicationController < ActionController::Base
  before_action :redirect_if_html
  before_action :authenticate_user!

  protect_from_forgery with: :null_session

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def redirect_if_html
    render template: 'pages/home' unless params["format"] == "json"
  end
end
