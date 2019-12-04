module CartDetailsHelper
  def check_stock(artwork)
    if artwork.stock >= 1
      return true
    else
      return false
    end
  end
end
