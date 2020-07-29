jsonfiles=$(ls ./data/*.json)
for file_a in $jsonfiles; do
  for file_b in $jsonfiles; do
    echo "comparing ${file_a} to ${file_b}"
    ruby -r "./score_diff.rb" -e "ScoreDiff.print_json_score('${file_a}', '${file_b}')"
  done
done
