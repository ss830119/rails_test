# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
#   provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
#   provider :line, ENV["LINE_Channel_ID"], ENV["LINE_Channel_Secret"]

#   OmniAuth.config.on_failure = Proc.new { |env|
#     OmniAuth::FailureEndpoint.new(env).redirect_to_failure
#   }  
# end


# 本地端測試模式

# OmniAuth.config.test_mode = false
# OmniAuth.config.mock_auth[:facebook] = {
#   "provider" => 'facebook',
#   "uid" => '12345678',
#   "info" => {
#     "email" => "service@playplus.solutions"
#   },
#   "extra" => {
#     "raw_info" => {
#       "name" => "playplus"
#     }
#   }
# }


# OmniAuth.config.mock_auth[:line] = {
#   :provider => "line",
#   :uid => "a123b4....",
#   :info => {
#     :name => "yamada tarou",
#     :image => "http://dl.profile.line.naver.jp/xxxxx",
#     :description => "breakfast now.",
#   },
#   :credentials => {
#     :token => "a1b2c3d4...", # The OAuth 2.0 access token
#     :secret => "abcdef1234"
#   },
#   :extra => {
#     # nil
#   }
# }

# OmniAuth.config.mock_auth[:google_oauth2] = {
#   "provider" => "google_oauth2",
#   "uid" => "100000000000000000000",
#   "info" => {
#     "name" => "John Smith",
#     "email" => "john@example.com",
#     "first_name" => "John",
#     "last_name" => "Smith",
#     "image" => "https://lh4.googleusercontent.com/photo.jpg",
#     "urls" => {
#       "google" => "https://plus.google.com/+JohnSmith"
#     }
#   },
#   "credentials" => {
#     "token" => "TOKEN",
#     "refresh_token" => "REFRESH_TOKEN",
#     "expires_at" => 1496120719,
#     "expires" => true
#   },
#   "extra" => {
#     "id_token" => "ID_TOKEN",
#     "id_info" => {
#       "azp" => "APP_ID",
#       "aud" => "APP_ID",
#       "sub" => "100000000000000000000",
#       "email" => "john@example.com",
#       "email_verified" => true,
#       "at_hash" => "HK6E_P6Dh8Y93mRNtsDB1Q",
#       "iss" => "accounts.google.com",
#       "iat" => 1496117119,
#       "exp" => 1496120719
#     },
#     "raw_info" => {
#       "kind" => "plus#personOpenIdConnect",
#       "gender" => "male",
#       "sub" => "100000000000000000000",
#       "name" => "John Smith",
#       "given_name" => "John",
#       "family_name" => "Smith",
#       "profile" => "https://plus.google.com/+JohnSmith",
#       "picture" => "https://lh4.googleusercontent.com/photo.jpg?sz=50",
#       "email" => "john@example.com",
#       "email_verified" => "true",
#       "locale" => "en",
#       "hd" => "company.com"
#     }
#   }
# }


