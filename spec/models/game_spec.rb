require 'spec_helper'

describe 'game' do

    before(:each) do
      @game1 = create(:game)
      @game2 = create(:game)

      @extra_deck = create(:deck, :game => @game2)
    end

    describe 'basic validation' do
      it 'has a valid factory' do
        create(:game).should be_valid
      end
      it 'can only save the same name once' do
        name = rand(1000).to_s
        create(:game, :name => name).should be_valid
        build(:game, :name => name).should_not be_valid
      end

    end

    describe 'creating new game' do
       it 'has a wildling deck by default' do
        @game1.decks.size.should == 1
        @game1.decks.first.deck_type_id.should == DeckType::wildLINGS
      end

      it 'has access to all the decks that are part of the current game' do
        @game2.decks.size.should == 2
        @game2.decks.include?(@extra_deck).should be true
      end
    end

    describe 'basic functionalty' do
      it 'return the wildling deck' do
        @game1.wildling_deck.deck_type_id.should == DeckType::wildLINGS
      end
    end
end