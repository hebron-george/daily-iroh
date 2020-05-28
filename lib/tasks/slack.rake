namespace :slack do
  desc "Post a random daily WiseSaying to Slack"
  task daily_post: :environment do
    qotd          = Quote.qotd
    # qotd = OpenStruct.new(message: "Hello World!", author: "Hebron George")


    slack_message = DailyMessagePresenter.slack_message(qotd)
    Slack::Web::Client.new.chat_postMessage(slack_message)
  end

end
