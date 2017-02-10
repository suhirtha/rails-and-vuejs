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

  def create
    @area = Area.new(area_param)
    if @area.save
      redirect_to :action => 'show'
   end
  end

  def show
    @company = Company.includes(:cities,:areas,:types,:rates).find(params[:id])
    @cities = @company.areas.group_by(&:city_id)
      respond_to do |format|
      format.html
       format.json  { 
        render :json => {
          :details => @company.as_json(:include => {:rates => {:include => :type}, :areas => {:include => :city}}),
          :types_list => Type.all,
          :cities_list => City.all,
          :areas_list => Area.all,
          :locations => @cities
          }
     }
    end
  end

  def edit
    @company = Company.includes(:cities,:areas,:types,:rates).find(params[:id])
  end
  def update
    @company = Company.includes(:cities).find(params[:id])
    @company.update(company_param)
    # @company.rates.delete_all
    
    company_param["rates_attributes"].each do |rate|
      Rate.find(rate["id"]).update(:room =>  rate["room"], :price => rate["price"])
    end

    redirect_to :action => 'show', :id => @company, :notice => 'Successfully Updated'
  end 
  def destroy
    area = Company.find(params[:id]).areas.find(params[:area_id])
    Company.find(params[:id]).areas.destroy(area)
    redirect_to :action => 'show', :notice => 'Successfully Deleted'
  end
  def area_param
    params.require(:areas).permit(:name)
  end
  def company_param
   params.require(:company).permit(
    :name,
    areas_attributes: [ :name],
    cities_attributes: [:name],
    rates_attributes: [:id,:room, :price],
    types_attributes: [:name])
  end
end
