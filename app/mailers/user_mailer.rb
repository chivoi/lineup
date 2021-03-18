class UserMailer < ApplicationMailer
  default from: 'complete.your.lineup.app@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to LineUp")

    # mg_client = Mailgun::Client.new ENV['api_key']
    # message_params = {:from    => ENV['gmail_username'],
    #                   :to      => @user.email,
    #                   :subject => 'Sample Mail using Mailgun API',
    #                   :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    # mg_client.send_message ENV['domain'], message_params
  end

  def new_gig_email(user:, gig:)
    @user = user
    @gig = gig
    mail(to: @user.email, subject: "Welcome to LineUp")
  end

  def new_request_email(host:, gig:)
    @url = "https://complete-your-lineup.herokuapp.com/users/sign_in"
    @host = host
    @gig = gig
    mail(to: @host.email, subject: "You have a new request on LineUp!")
  end
end
