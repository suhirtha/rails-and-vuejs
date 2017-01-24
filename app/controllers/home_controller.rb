class HomeController < ApplicationController
  def index
  	respond_to do |format|
      format.html
      format.json { 
        if params["column"] == "city"
          render :json => City.where("name like ?","%#{params[:term]}%").pluck(:name)
        else
          city = City.where(:name => params[:city]).first
          render :json => city.companies.where("companies.name like ?","%#{params[:term]}%").pluck(:name).uniq
        end
      }
    end
  end
end
