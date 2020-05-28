module DailyMessagePresenter
  def self.slack_message(quote_model)
    quote  = quote_model.message
    author = quote_model.author

    text = "```#{quote}```\n- #{author}"

    {
      text: text,
      channel: "#daily-iroh",
      icon_emoji: ":iroh:",
    }
  end
end
