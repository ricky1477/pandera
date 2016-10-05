require_relative '../lib/bowling_game'
describe BowlingGame do
    let(:game) { BowlingGame.new }

    it 'scores a gutter game' do
        #expect(actual_value).to equal(expected_value)
        game.pins([0] * 20)
        expect(game.score).to eq(0)
    end

    it 'score a game of 1s' do
        game.pins([1] * 20)
        expect(game.score).to eq(20)
    end

    it 'score a game with spare' do
        game.pins([4,6,5] + [0]*17 )
        expect(game.score).to eq(20)
    end

end