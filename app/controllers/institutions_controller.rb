class InstitutionsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :get_institution,except:[:index,:new,:create]

  def index
    @institutions=Institution.all
  end

  def show

  end

  def new
    @institution= Institution.new
  end

  def create
    
    @institution=Institution.create(institution_params)

    @category = params[:institution][:category]
    @category.map{|p|  
      if !(p.to_i == 0)
        @institution.category << Category.find(p.to_i)
      end
    }

    if @institution.save 
      redirect_to institution_path(@institution.id)
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    @category = params[:institution][:category]
    @institution.category.clear 
    @category.map{|p|  
      if !@institution.category.exists?(p.to_i) and !(p.to_i == 0)
        @institution.category << Category.find(p.to_i)
      end
    }

    @institution.update(institution_params)
    redirect_to institution_path(@institution.id)
  end

  def destroy
    @institution.destroy()
    redirect_to institutions_path
  end

  private

  def get_institution
    @institution=Institution.find(params[:id])
  end

  def institution_params
    params.require(:institution).permit(:name,:description,:address,:phoneNumber,:workTime,{images:[]})
  end

end
