class Admin::AdminBaseController < ApplicationController
	layout 'admin/admin'
  authenticates_via_http_basic(:user, :name, :password, {:conditions => {:is_admin => true}})
end
