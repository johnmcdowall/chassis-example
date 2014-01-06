twilio_account_sid = ENV.fetch 'TWILIO_ACCOUNT_SID'
twilio_auth_token = ENV.fetch 'TWILIO_AUTH_TOKEN'
twilio_number = ENV.fetch 'TWILIO_NUMBER'

SmsService.backend = SmsService::Twilio.new twilio_account_sid, twilio_auth_token, twilio_number