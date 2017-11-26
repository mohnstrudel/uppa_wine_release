class Admin::WinesController < AdminController
  include CrudConcern
  
  before_action :find_wine, only: [:edit, :update, :destroy]

  def index
    @wines = Wine.all
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    create_helper(@wine, "edit_admin_wine_path")
  end

  def update
    update_helper(@wine, "edit_admin_wine_path", wine_params)
  end

  def edit
  end

  def destroy
    destroy_helper(@wine, "admin_wines_path")
  end

  private

  def find_wine
    @wine = Wine.find(params[:id])
  end

  def wine_params
    params.require(:wine).permit(Wine.attribute_names(&:to_sym))
  end

end
