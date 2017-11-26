class Front::StaticPagesController < FrontController
  def about
  end

  def home
  end

  def contacts
    @clean_sales_phone = @setting.clean_phone(@setting.sales_phone)
    @clean_visit_phone = @setting.clean_phone(@setting.visit_phone)
  end

  def technology
  end

  def visit
  end

  def club
  end

  def terra
  end

  def age_confirmation
    session[:already_18] = true
    redirect_to root_path
  end
end
