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
    @areas = Company.includes(:cities).find(params[:id]).areas
  end
  def edit
    @company = Company.includes(:cities).find(params[:id])
    @path = params[:area_id]
  end
  def update
    @update = 'Successfully Updated'
    @company = Company.includes(:cities).find(params[:id])
    if @company.update(company_param)
    redirect_to :action => 'show', :id => @company, :notice => @update
    end
  end 
  def destroy
    area = Company.find(params[:id]).areas.find(params[:area_id])
    Company.find(params[:id]).areas.delete(area)
    redirect_to :action => 'index', :notice => 'Successfully Deleted'
  end
  def company_param
   params.require(:company).permit(
    :name,
    areas_attributes: [ :name],
    cities_attributes: [:name],
    rates_attributes: [:room, :price],
    types_attributes: [:name])
  end
end
