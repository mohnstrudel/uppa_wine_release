class Front::VintagesController < FrontController
  def index
    @vintages = Vintage.order(sortable: :asc)
  end
end
