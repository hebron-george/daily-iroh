require 'faraday'

class Quote
  def self.qotd
    response = Faraday.get("https://quotes.rest/qod?language=en")
    body     = JSON.parse(response.body)
    return OpenStruct.new(message: body, author: "Unsuccessful response from API") unless response.success?

    quote   = body.dig('contents', 'quotes').first
    message = quote.dig('quote')
    author  = quote.dig('author')
    OpenStruct.new(message: message, author: author)
  end
end