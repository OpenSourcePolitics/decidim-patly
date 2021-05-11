
Rails.application.config.middleware.use OmniAuth::Builder do
  omniauth_config = Rails.application.secrets.dig(:omniauth)

  if omniauth_config[:publik].present?
    provider(
      :publik,
      setup: setup_provider_proc(:publik,
        client_id: :client_id,
        client_secret: :client_secret,
        site: :site
      ),
      scope: "openid email profile"
    )
  end
end
