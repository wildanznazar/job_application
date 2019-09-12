class Applicant < ApplicationRecord
  belongs_to :job_ad
  belongs_to :user
  belongs_to :company, class_name: "User", foreign_key: "company_id"

  rails_admin do
    label "Lamaran Pekerjaan"
    label_plural "Lamaran Pekerjaan"

    object_label_method do
      :applicant_user
    end

    list do
      field :user do
        label "Pelamar Kerja"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"]
        end
        pretty_value do
          path = bindings[:view].main_app.profile_path(id: bindings[:object].user_id)
          bindings[:view].content_tag(:a, bindings[:object].user.profiles.first.name, href: path, target: "_blank")
        end
      end
      field :job_ad do
        label "Iklan Pekerjaan"
        pretty_value do
          path = bindings[:view].main_app.job_detail_path(id: bindings[:object].job_ad_id)
          bindings[:view].content_tag(:a, bindings[:object].job_ad.position_title, href: path, target: "_blank")
        end
      end
      field :status do
        label "Status"
      end
			exclude_fields :created_at, :updated_at
    end

    edit do
      field :job_ad do
        label "Iklan Pekerjaan"
        read_only true
      end
      field :applicaiton do
        label "Surat Lamaran"
        read_only true
      end
      field :status do
        label "Status"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"]
        end
      end

			exclude_fields :created_at, :updated_at
    end
  end

  before_create do
    self.status = "Proses"
  end

  def applicant_user
    self.user.profiles.first.name
  end

  def status_enum
  	["Proses", "Diterima", "Ditolak"]
  end
end
