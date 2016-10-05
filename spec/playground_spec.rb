require_relative '../lib/playground'
describe Playground do
    context 'when there are are no children' do
        let(:playground) { Playground.new(0) }

        it 'is quite boring place' do
            #expect(actual_value).to equal(expected_value)
            mood = playground.mood
            expect(mood).to eq('boring')
        end

        it 'is empty' do
            expect(playground).to be_empty
        end
    end
end