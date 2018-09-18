class Mentor::MentorBaseController < ApplicationController 
  before_action :authenticate_mentor!
end