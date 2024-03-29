class JobMailer < ApplicationMailer
  def new_applicant
    @user = User.find(params[:user_id])
    @job_ad = JobAd.find(params[:job_ad_id])
    @company = @job_ad.user
    subject = "Kandidat Baru - #{@job_ad.position_title}"

    mail(to: @company.email, subject: subject)
  end

  def applicant_status
    @user = User.find(params[:user_id])
    @job_ad = JobAd.find(params[:job_ad_id])
    @company = @job_ad.user
    subject = "Status Lamaran - #{@job_ad.position_title}"

    mail(to: @user.email, subject: subject)
  end

  def contact
    @name = params[:name]
    @message = params[:message]
    @email = params[:email]
    email_with_name = %("Pesan Dari User" <#{@email}>)
    subject = "Pesan Dari #{@name}"

    mail(from: email_with_name, to: Setting.first.email, subject: subject)
  end
end
