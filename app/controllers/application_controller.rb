class ApplicationController < ActionController::Base
  before_action :display_message
  after_action :after_message


  protected

  def after_sign_in_path_for(resource)
    admin_dashboard_path
  end

  private

  def display_message
    puts 'I am an inherited before action filter'
  end

  def after_message
    puts 'After action callback'
  end
end
