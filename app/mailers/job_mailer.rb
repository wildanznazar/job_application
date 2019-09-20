class JobMailer < ApplicationMailer
  def new_applicant
    @user = User.find(params[:user_id])
    @job_ad = JobAd.find(params[:job_ad_id])
    @company = @job_ad.user
    subject = "Kandidat Baru - #{@job_ad.position_title}"

    mail(to: @company.email, subject: subject)
  end

  def applicant_status

  end
end
