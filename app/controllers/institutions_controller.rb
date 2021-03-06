class InstitutionsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :get_institution,except:[:index,:new,:create,:positiv_vote,:negativ_vote]

  def index
    @institutions=Institution.all
  end
  
  def show
    @rating=Rating.find_by(user_id: current_user,institution_id: @institution.id)
    @ratings=Rating.where(institution_id: @institution.id)
    @ratingComments=[]
    @ratings.each do |rating| 
      @ratingComments[rating.id]=RatingComment.where(rating_id: rating.id)
    end
    if current_user != nil
      @ratings=@ratings.where.not(user_id: current_user.id)
    end
    @comments=InstitutionComment.where(institution_id: @institution.id)

    #validation
    @institutionComment=InstitutionComment.new
    @ratingComment=RatingComment.new
  end

  def new
    @categories=Category.all
    @institution= Institution.new
    @workTime=WorkTime.new
  end

  def create
    @categories=Category.find(params[:category_ids])
    @institution=Institution.create(institution_params)

    @institution.category = @categories
    params[:work_time][:institution_id]=@institution.id
    @workTime=WorkTime.create(workTime_params)

    if @institution.save && @workTime.save
      redirect_to institution_path(@institution.id)
    else
      render 'new'
    end
  end

  def edit
     @categories=Category.all
  end

  def update
    @categories=Category.find(params[:category_ids])
    @institution.category.clear
    @institution.category = @categories

    @workTime.update(workTime_params)

    @institution.update(institution_params)
    redirect_to institution_path(@institution.id)
  end

  def destroy
    @institution.destroy()
    redirect_to institutions_path
  end

  def rating
    params[:rating][:user_id]=current_user.id
    params[:rating][:institution_id]=@institution.id
    if @rating.nil?
    @rating = Rating.create(ratign_params)
    else
      @rating.errors.full_messages.each do |msg|  
        @msg = msg
      end  
      flash[:notice] = "#{@msg}"
      redirect_to institution_path(@institution.id)
    end
    kitchen = servise = cleannes = atmosphere =0

    ratings =Rating.where(institution_id: @institution.id)
    kitchen = servise = cleannes = atmosphere =0
    ratings.each  do |r|
      kitchen+=r.kitchen
      servise+=r.servise
      cleannes+=r.cleannes
      atmosphere+=r.atmosphere
    end
    @institution.update(kitchen: kitchen/ratings.count, servise: servise/ratings.count, cleannes: cleannes/ratings.count, atmosphere: atmosphere/ratings.count)
    redirect_to institution_path(@institution.id)
  end
  
  private

  def get_institution
    @institution=Institution.find(params[:id])
    @workTime=WorkTime.find_by(institution_id: @institution)
  end

  def institution_params
    params.require(:institution).permit(:name,:description,:address,:phoneNumber,:workTime,{images:[]})
  end

  def workTime_params
    params.require(:work_time).permit(:institution_id,:mondayWork,:mondayStart, :mondayEnd,:tuesdayWork, :tuesdayStart, :tuesdayEnd, :wednesdayWork, :wednesdayStart, :wednesdayEnd,:thursdayWork, :thursdayStart, :thursdayEnd, :fridayWork , :fridayStart, :fridayEnd, :saturdayWork, :saturdayStart, :saturdayEnd ,:sundayWork, :sundayStart, :sundayEnd)
  end

  def ratign_params
    params.require(:rating).permit(:user_id,:institution_id,:kitchen,:servise,:cleannes,:atmosphere,:text)
  end

end
