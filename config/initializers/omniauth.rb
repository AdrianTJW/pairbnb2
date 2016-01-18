OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '943886895659161', '910ed74f6d178a5eba8b558b75b33e5a'
end