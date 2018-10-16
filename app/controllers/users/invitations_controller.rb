class Users::InvitationsController < Devise::InvitationsController

  private

  # this is called when accepting invitation
  # should return an instance of resource class
  def accept_resource
    resource = resource_class.accept_invitation!(update_resource_params)
    if resource.is_a?(Admin)
      OnboardingMailer.admin_onboarding(resource).deliver_later
    elsif resource.is_a?(Mentor)
      OnboardingMailer.mentor_onboarding(resource).deliver_later
    elsif resource.is_a?(Client)
      OnboardingMailer.client_onboarding(resource).deliver_later
    end
    resource
  end
end