class Admin::VintagesController < AdminController
  include CrudConcern
  
  before_action :find_vintage, only: [:edit, :update, :destroy]

  def index
    @vintages = Vintage.all
  end

  def new
    @vintage = Vintage.new
    @vintage.wines.build
  end

  def create
    @vintage = Vintage.new(vintage_params)
    create_helper(@vintage, "edit_admin_vintage_path")
  end

  def update
    update_helper(@vintage, "edit_admin_vintage_path", vintage_params)
  end

  def edit
    if @vintage.wines.blank?
      @vintage.wines.build
    end
  end

  def destroy
    destroy_helper(@vintage, "admin_vintages_path")
  end

  private

  def find_vintage
    @vintage = Vintage.friendly.find(params[:id])
  end

  def vintage_params
    params.require(:vintage).permit(Vintage.attribute_names(&:to_sym).push(
      wines_attributes: Wine.attribute_names(&:to_sym).push(:_destroy)))
  end

end
