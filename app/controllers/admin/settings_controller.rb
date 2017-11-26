class Admin::SettingsController < AdminController
  include CrudConcern
  
  before_action :find_setting, only: [:edit, :update, :destroy]

  def index
    @settings = Setting.all
  end

  def new
    @setting = Setting.new
    @setting.opening_hours.build
  end

  def create
    @setting = Setting.new(setting_params)
    create_helper(@setting, "edit_admin_setting_path")
  end

  def update
    update_helper(@setting, "edit_admin_setting_path", setting_params)
  end

  def edit
    if @setting.opening_hours.blank?
      @setting.opening_hours.build
    end
  end

  def destroy
    destroy_helper(@setting, "admin_settings_path")
  end

  private

  def find_setting
    @setting = Setting.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit(Setting.attribute_names(&:to_sym).push(
      opening_hours_attributes: [:id, :title, :value, :_destroy, :setting_id]))
  end

end

