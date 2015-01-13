class Dashboard::BaseController < ApplicationController
	layout "dashboard"

	before_action :require_admin
	def require_admin
		redirect_to login_path unless current_user.admin
	end

end
