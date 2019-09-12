class HomeController < ApplicationController
	before_action :authenticate_user!, except: [:index, :companies, :browse_jobs, :job_detail, :job_ad]

	def index
		if user_signed_in?
			if current_user.role == CONFIG["company"]
				redirect_to companies_url
			elsif current_user.role == CONFIG["admin"]
				redirect_to "/admin"
			end
		else
			session[:company] = false
		end
	end

	def companies
		session[:company] = true
	end

	def job_ad
		redirect_to job_detail_path(params[:id])
	end

	def profile
		if params[:id].present?
			@profile = User.find(params[:id]).profiles.first
		else
			@profile = current_user.profiles.first
		end
	end

	def browse_jobs
		type = "and employment_type in (#{params[:type].map{ |i|  %Q('#{i}') }.join(',')})" if params[:type].present? && !(params[:type].include? "Clear")
		@type = params[:type] ||= []
		@type = [] if (params[:type].include? "Clear")
		@browse_jobs = JobAd.search(params[:search]).where("true #{type}").order("created_at desc").page(params[:page])
	end

	def job_detail
		@job_detail = JobAd.find(params[:id])
	end

	def applicant

	end

	def apply_page
		job_ad = JobAd.find(params[:id])
		@applicant = Applicant.new(job_ad_id: job_ad.id, user_id: current_user.id, company_id: job_ad.user.id, status: "Proses")
	end

	def apply
		@applicant = Applicant.new(applicant_params)

    respond_to do |format|
      if @applicant.save
        format.html { redirect_to job_detail_url(id: @applicant.job_ad_id), notice: 'Lamaran Anda Berhasil Dikirim.' }
      else
        format.html { redirect_to job_detail_url(id: @applicant.job_ad_id), alert: @applicant.errors.full_messages.to_sentence }
      end
    end
	end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_params
      params.require(:applicant).permit!
    end
end
