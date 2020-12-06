import '../bin/aoc_2020_3.dart';
import 'package:test/test.dart';


void main()
{
  //============================================================================
  test( 'Part1', ()
  {
    var map = ReadInput( 'test/test_input_3.txt' );
    var slope = Pair<int, int>( 3, 1);
    expect( part1( slope, map ), 7 );
   });

  //============================================================================
   test( 'ProductTrees', () 
   {
    var map = ReadInput( 'test/test_input_3.txt' );
    List<Pair<int,int>> slopes = 
    [
      Pair( 1,1 ),
      Pair( 3,1 ),
      Pair( 5,1 ),
      Pair( 7,1 ),
      Pair( 1,2 ),
    ];
    expect( part2( slopes, map ), 336 );
   });
}
