class MaterialNotifier < ActionMailer::Base
  default from: "slibujeme.app@gmail.com"
  
  def flag_material(material, email, note)
    @material = material
    @email    = email
    @note     = note
    mail(:to => "slibujeme.app@gmail.com",
         :subject => I18n.t("mail.flag.subject")
    )
  end
  
  def materials_user_created(material, user)
    @material = material
    @user     = user
    mail(
      :to => @user.email,
      :subject => I18n.t("mail.account_created.subject")
    )
  end
end
