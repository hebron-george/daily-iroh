require_relative "../../../app/models/quote"

RSpec.describe Quote do
  describe ".qotd" do
    subject { Quote.qotd }

    before do
      allow(Faraday).to receive(:get).and_return(stubbed_object)
    end

    let(:stubbed_object) do
      OpenStruct.new(
        body: body,
        success?: success
      )
    end

    context "failed response" do
      let(:success) { false }
      let(:body)    { '{"key": "value"}' }
      it { is_expected.to eq(OpenStruct.new(message: {'key' => 'value'}, author: "Unsuccessful response from API"))}
    end

    context "successful response" do
      let(:success) { true }
      let(:body)    { '{"contents": {"quotes": [{"quote": "Suh dude", "author": "Hebron"}]} }' }
      it { is_expected.to eq(OpenStruct.new(message: "Suh dude", author: "Hebron"))}
    end
  end
end
