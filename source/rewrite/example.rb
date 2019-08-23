require_relative 'grammar'

test_pat = Pattern.new(
    match: Pattern.new(/abc/).then(match: /aaa/, tag_as: "part1.part2.$reference(ghi)"),
    tag_as: "part1",
    reference: "abc",
).maybe(/def/).then(
    match: /ghi/,
    tag_as: "part2",
    reference: "ghi"
).lookAheadFor(/jkl/).matchResultOf("abc").recursivelyMatch("ghi").or(
    match: /optional/,
    tag_as: "variable.optional.$match"
)
puts test_pat.to_tag

test_range = PatternRange.new(
    start_pattern: /abc/,
    end_pattern: /def/,
)

puts test_range
puts test_range.to_tag