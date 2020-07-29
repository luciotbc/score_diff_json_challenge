require_relative '../lib/score_diff'

RSpec.describe ScoreDiff do
  let(:hash_a) { { a: 1, b: [1, 'a'], c: 'b', d: { e: 2, f: { g: 3 } } } }

  describe '#calculate_hash_score' do
    subject { ScoreDiff.calculate_hash_score(hash_a, hash_b) }

    context 'when hash is equals' do
      let(:hash_b) { hash_a }

      it 'should be zero' do
        expect(subject).to eq 0
      end
    end
  end
end
