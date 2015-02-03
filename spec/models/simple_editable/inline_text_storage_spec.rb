require 'rails_helper'

module SimpleEditable
  RSpec.describe InlineTextStorage, type: :model do
    before :all do
      @storage = InlineTextStorage.new
      @text = InlineText.create!(key: 'title_2', text: 'Hello, this is title')
    end

    it 'should read all' do
      expect(@storage.read_all).to eq(true)
    end

    it 'should drop all' do
      @storage.drop_all
      expect(InlineText.all.length).to eq(0)
    end

    it 'should find record' do
      text = @storage.find_or_create('title_2', 'Hello')
      expect(text).to eq(@text.text)
    end

    it 'should create record' do
      text = @storage.find_or_create('title_3', 'Hello')
      expect(text).to eq('Hello')
    end
  end
end
