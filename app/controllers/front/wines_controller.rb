class Front::WinesController < FrontController
  def index
    @wines = Wine.all
  end

  def show
    @wine = Wine.friendly.find(params[:id])
    
    @vintage = @wine.vintage

    @next_wine = @vintage.next_wine(@wine)
    @previous_wine = @vintage.previous_wine(@wine)
    # debug
  end

  

end
