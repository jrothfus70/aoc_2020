import 'package:test/test.dart';
import '../bin/aoc_2020_5.dart';


//==============================================================================
void main()
{
  //============================================================================
  test( 'findRow', () 
  {
    expect( findRow( 'FBFBBFFRLR' ), 44 );
  });

  //============================================================================
  test( 'findCol', () 
  {
    expect( findColumn( 'FBFBBFFRLR' ), 5 );
  });

  //============================================================================
  test( 'findSeatId', () 
  {
    expect( findSeatId( 'FBFBBFFRLR' ), 357 );
    expect( findSeatId( 'BFFFBBFRRR' ), 567 );
    expect( findSeatId( 'FFFBBBFRRR' ), 119 );
    expect( findSeatId( 'BBFFBBFRLL' ), 820 );
  });

  //============================================================================
  test( 'findMaxSeatId', () 
  {
    var input = [
      'FBFBBFFRLR',
      'BFFFBBFRRR',
      'FFFBBBFRRR',
      'BBFFBBFRLL'
    ];
    expect( findMaxSeatId( input ), 820 );
  });

}


