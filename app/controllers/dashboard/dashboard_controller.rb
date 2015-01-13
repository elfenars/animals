class Dashboard::DashboardController < Dashboard::BaseController
	layout "dashboard"

	def index
		@user = User.all
	end
end
