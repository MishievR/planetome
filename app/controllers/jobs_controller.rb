class JobsController < ApplicationController

  before_action :require_admin, except: [:new, :create, :index, :show]
  before_action :authenticate_user!, except: [:new, :create, :index, :show]

    def index
      @jobs = Job.all

      if params[:search]
        @jobs = Job.where(['position like ?', "%#{params[:search]}%"])
      else
        @jobs = Job.all
      end

    end

    def new
      @job = Job.new
    end

    def create
      @job = Job.new(job_params)

      @amount = 900

      # token = params[:stripeToken]
      # email = params[:email_to_contact]

      customer = Stripe::Customer.create(
        :email => params[:email_to_contact],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,

        # :source => token,
        :amount      => @amount,
        :currency    => 'usd',
        :description => @job.position,
        :statement_descriptor => @job.position,
        # :email => email,

      )
      if @job.save
        flash[:success] = "#{@job.position} position at #{@job.employer.company_name} was created succesfully"
        redirect_to @job
      else
        render 'new'
      end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_job_path

    end

    def edit
      @job = Job.find(params[:id])
    end

    def show
      @job = Job.find(params[:id])
      @job_categories = @job.categories
      # @community_fields = @field.communities
      # @project_fields = @field.projects

    end

    def update
      @job = Job.find(params[:id])
      if @job.update(job_params)
        flash[:success] = "#{@job.position} position at #{@job.employer.company_name} was updated succcessfully"
        redirect_to job_path(@job)
      else
        render 'edit'
      end
    end


    private
    def job_params
      params.require(:job).permit(
        :position,
        :purpose,
        :impact,
        :location,
        :is_remote,
        :is_special_requirements,
        :special_requirements,
        :responsibilities,
        :job_description,
        :requirements,
        :link,
        :email_to_contact,
        :salary, :employer_id, category_ids: [], community_ids: [])
    end

    def require_admin
      if user_signed_in? and !current_user.admin?
        flash[:danger] = "Only admins can perform that action"
        redirect_to jobs_path
      end
    end
end
