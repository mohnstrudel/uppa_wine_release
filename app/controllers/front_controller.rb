class FrontController < ApplicationController
  layout 'front'

  before_action :find_setting
  before_action :is_18?
  before_action :set_locale

  private

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

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
