class EmployersController < ApplicationController


    def index
      @employers = Employer.all
    end

    def new
      @employer = Employer.new
    end

    def create
      @employer = Employer.new(employer_params)
      if @employer.save
        flash[:success] = "Employer was created succesfully"
        redirect_to @employer
      else
        render 'new'
      end
    end

    def edit
      @employer = Employer.find(params[:id])
    end

    def show
      @employer = Employer.find(params[:id])
      # @community_fields = @field.communities
      # @project_fields = @field.projects

    end

    def update
      @employer = Employer.find(params[:id])
      if @employer.update(employer_params)
        flash[:success] = "Employer was updated succcessfully"
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
