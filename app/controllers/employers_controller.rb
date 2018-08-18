class EmployersController < ApplicationController

    before_action :require_admin, except: [:new, :create, :index, :show]
    before_action :authenticate_user!, except: [:new, :create, :index, :show]

    def index
      @employers = Employer.all
    end

    def new
      @employer = Employer.new
    end

    def create
      @employer = Employer.new(employer_params)
      if @employer.save
        flash[:success] = "#{@employer.company_name} was created succesfully"
        redirect_to new_job_path
      else
        render 'new'
      end
    end

    def edit
      @employer = Employer.find(params[:id])
    end

    def show
      @employer = Employer.find(params[:id])
      @jobs = @employer.jobs
    end

    def update
      @employer = Employer.find(params[:id])
      if @employer.update(employer_params)
        flash[:success] = "#{@employer.company_name} was updated succcessfully"
        redirect_to employer_path(@employer)
      else
        render 'edit'
      end
    end


    private
    def employer_params
      params.require(:employer).permit(
        :company_name,
        :pitch,
        :about,
        :company_mission,
        :hq_location,
        :number_of_employees,
        :year_founded,
        :logo,
        :background,
        :link,
        :twitter,
        :facebook,
        :industry)
    end

    def require_admin
      if user_signed_in? and !current_user.admin?
        flash[:danger] = "Only admins can perform that action"
        redirect_to employers_path
      end
    end



end
