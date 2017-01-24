class HomeController < ApplicationController
  autocomplete :city, :name
  autocomplete :company, :name
  def index
  	@company = Company.select("companies.name")
  	respond_to do |format|
      format.html
      format.json { render :json => @company }
    end
  end
  def edit
  	@etc = params[:data]
  	#@etc = Company.joins([{types: :rates}],:cities,:areas).where("company_id = ?", params[:data])
  	@all = Company.joins([{types: :rates}],:cities,:areas).distinct.select("rates.room as room,rates.price as price,types.name as type,companies.name as hotel,cities.name as city,areas.name as area")
	puts (@etc.inspect)  
  end

end
