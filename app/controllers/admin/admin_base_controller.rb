class Admin::AdminBaseController < ApplicationController 
  before_action :authenticate_admin!
end