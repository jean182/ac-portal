class Admin::LogsController < ApplicationController
  def index
    @logs = Log.order('created_at DESC')
  end

end
