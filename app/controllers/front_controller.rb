class FrontController < ApplicationController
  layout 'front'

  before_action :find_setting
  before_action :is_18?

  private

  def find_setting
    @setting = Setting.first
  end

  def is_18?
    if session[:already_18]
      @legal_age = true
    else
      @legal_age = false
    end
  end
end
