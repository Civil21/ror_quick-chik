class InstitutionsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :get_institution,except:[:index,:new,:create]

  def index
    @institutions=Institution.all
  end

  def show
    @workTime=WorkTime.find_by(institution_id: @institution)
  end

  def new
    @institution= Institution.new
    @workTime=WorkTime.new
  end

  def create
    
    @categories=Category.find(params[:category_ids])
    @institution=Institution.create(institution_params)

    if @institution.save 
      
      @institution.category << @categories

      @work_time=WorkTime.create(institution_id: @institution.id , 
        mondayWork: params[:workTime][:mondayWork], mondayStart: params[:workTime][:mondayStart], mondayEnd:params[:workTime][:mondayEnd], 
        tuesdayWork: params[:workTime][:tuesdayWork], tuesdayStart: params[:workTime][:tuesdayStart], tuesdayEnd: params[:workTime][:tuesdayEnd],
        wednesdayWork:params[:workTime][:wednesdayWork], wednesdayStart: params[:workTime][:wednesdayStart], wednesdayEnd: params[:workTime][:wednesdayEnd],
        thursdayWork: params[:workTime][:thursdayWork], thursdayStart: params[:workTime][:thursdayStart], thursdayEnd: params[:workTime][:thursdayEnd],
        fridayWork: params[:workTime][:fridayWork], fridayStart: params[:workTime][:fridayStart], fridayEnd: params[:workTime][:fridayEnd],
        saturdayWork: params[:workTime][:saturdayWork], saturdayStart: params[:workTime][:saturdayStart], saturdayEnd: params[:workTime][:saturdayEnd],
        sundayWork: params[:workTime][:sundayWork], sundayStart: params[:workTime][:sundayStart], sundayEnd: params[:workTime][:sundayEnd],)

      redirect_to institution_path(@institution.id)

    else
      render 'new'
    end
  end

  def edit

  end

  def update

    @institution.categories << Category.find(params[:category_ids])

      @work_time=WorkTime.create(institution_id: @institution.id , 
        mondayWork: params[:workTime][:mondayWork], mondayStart: params[:workTime][:mondayStart], mondayEnd:params[:workTime][:mondayEnd], 
        tuesdayWork: params[:workTime][:tuesdayWork], tuesdayStart: params[:workTime][:tuesdayStart], tuesdayEnd: params[:workTime][:tuesdayEnd],
        wednesdayWork:params[:workTime][:wednesdayWork], wednesdayStart: params[:workTime][:wednesdayStart], wednesdayEnd: params[:workTime][:wednesdayEnd],
        thursdayWork: params[:workTime][:thursdayWork], thursdayStart: params[:workTime][:thursdayStart], thursdayEnd: params[:workTime][:thursdayEnd],
        fridayWork: params[:workTime][:fridayWork], fridayStart: params[:workTime][:fridayStart], fridayEnd: params[:workTime][:fridayEnd],
        saturdayWork: params[:workTime][:saturdayWork], saturdayStart: params[:workTime][:saturdayStart], saturdayEnd: params[:workTime][:saturdayEnd],
        sundayWork: params[:workTime][:sundayWork], sundayStart: params[:workTime][:sundayStart], sundayEnd: params[:workTime][:sundayEnd],)

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
