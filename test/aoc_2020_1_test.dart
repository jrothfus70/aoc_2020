import '../bin/aoc_2020_1.dart';
import 'package:test/test.dart';

Iterable<int> test_data =
[ 1721,
  979,
  366,
  299,
  675,
  1456
];

void main()
{
  test('CalcSumOf2', ()
  {
    var result = find2020SumOf2( test_data );
    expect(result, 514579);
  });

  test('CalcSumOf3', ()
  {
    var result = find2020SumOf3( test_data );
    expect(result, 241861950);
  });
}
