class Admin::ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "admin", password: "secret"

  layout "./admin/layouts/application"
end