class CompaniesController < ApplicationController
  def index
    #@company = Company.joins([{types: :rates}],:cities,:areas).distinct.select("companies.id,companies.name as hotel,areas.name as area,cities.name as city")
  	@company = Company.includes(:cities)
    respond_to do |format|
      format.html
      format.json { 
        if params["column"] == "city"
          render :json => City.where("name like ?","%#{params[:term]}%").pluck(:name)
        else
          city = City.where(:name => params[:city]).first
          render :json => city.companies.where("companies.name like ?","%#{params[:term]}%").select("companies.name as label" ,:id).uniq
        end
      }
    end
  end
  def show
    @company = Company.includes(:cities).find(params[:id])
    @area = Company.includes(:cities).find(params[:id]).areas
  end
  def edit
    @company = Company.includes(:cities).find(params[:id])
  end
end
