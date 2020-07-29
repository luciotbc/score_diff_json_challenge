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

    context 'when hash is completely different' do
      let(:hash_b) { { x: 1, y: 2, z: 3 } }

      it 'should be one' do
        expect(subject).to eq 1
      end
    end

    context 'when hash is partial different' do
      let(:hash_b) { { a: 1, b: [1, 'a'], c: 2 } }

      it 'should be the percentage of compatibility' do
        expect(subject).to eq 0.5
      end
    end
  end

  describe '#deep_diff' do
    let(:partial_result) { { differences: 0, keys_count: 0 } }

    subject { ScoreDiff.deep_diff(hash_a, hash_b, partial_result) }

    context 'when hash is equals' do
      let(:hash_b) { hash_a }

      it 'partial result does not change' do
        expect(subject).to eq partial_result
      end
    end

    context 'when hash is completely different' do
      let(:hash_b) { { x: 1, y: 2, z: 3 } }

      it 'total of differences are equal to total of keys' do
        expect(subject).to eq({ differences: 7, keys_count: 7 })
      end
    end

    context 'when hash is partial different' do
      let(:hash_b) { { a: 1, b: [1, 'a'], c: 2 } }

      it 'should be the percentage of compatibility' do
        expect(subject).to eq({ differences: 2, keys_count: 4 })
      end
    end
  end
end
