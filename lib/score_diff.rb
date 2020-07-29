require 'json'

class ScoreDiff
  def self.calculate_json_score(file_name_a, file_name_b)
    hash_a = JSON.parse(File.read(file_name_a))
    hash_b = JSON.parse(File.read(file_name_b))
    calculate_hash_score(hash_a, hash_b)
  end

  def self.calculate_hash_score(a, b)
    return 0 if a == b

    partial_result = { keys_count: 0, differences: 0 }
    deep_diff(a, b, partial_result)
    puts "partial_result: #{partial_result} result: #{partial_result[:differences].to_f / partial_result[:keys_count]}"
    partial_result[:differences].to_f / partial_result[:keys_count]
  end

  def self.deep_diff(a, b, partial_result)
    partial_result[:keys_count] += (a.keys | b.keys).length
    (a.keys | b.keys).each do |k|
      next if a[k] == b[k]

      partial_result[:differences] += 1
      partial_result = deep_diff(a[k], b[k], partial_result) if a[k].is_a?(Hash) && b[k].is_a?(Hash)
    end
    partial_result
  end
end
