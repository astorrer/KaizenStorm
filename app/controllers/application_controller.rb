class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_tenant!
  
     ##    milia defines a default max_tenants, invalid_tenant exception handling
     ##    but you can override these if you wish to handle directly
  rescue_from ::Milia::Control::MaxTenantExceeded, :with => :max_tenants
  rescue_from ::Milia::Control::InvalidTenantAccess, :with => :invalid_tenant

  # optional callback for post-authenticate_tenant! processing
  def callback_authenticate_tenant
    @org_name = ( Tenant.current_tenant.nil?  ?
      "Kaizen"   :
      Tenant.current_tenant.name 
    )
    # set_environment or whatever else you need for each valid session
  end

  #   org_name will be passed to layout & view
  #   this sets the default name for all situations
  def prep_org_name()
    @org_name ||= "Kaizen"
  end
end
