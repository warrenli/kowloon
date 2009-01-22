class UserSession < Authlogic::Session::Base
  login_blank_message          I18n.t("authlogic.user_session.login_blank")
  login_not_found_message      I18n.t("authlogic.user_session.login_not_found")
  not_active_message           I18n.t("authlogic.user_session.not_active")
  not_approved_message         I18n.t("authlogic.user_session.not_approved")
  not_confirmed_message        I18n.t("authlogic.user_session.not_confirmed")
  password_blank_message       I18n.t("authlogic.user_session.password_blank")
  password_invalid_message     I18n.t("authlogic.user_session.password_invalid")

  find_by_login_method  :find_by_login_or_email

end
