import 'package:test/test.dart';
import '../bin/aoc_2020_4.dart';

//==============================================================================
void main()
{
  //============================================================================
  test( 'readInput', () 
  {
    var data = readInput( 'test/test_input_4.txt' );
    expect( data.length, 4 );
  });

  //============================================================================
  test( 'getPassports', () 
  {
    var data = readInput( 'test/test_input_4.txt' );
    var passports = getPassports( data );
    expect( passports.length, 4 );
  });

  //============================================================================
  test( 'Part 1', () 
  {
    var data = readInput( 'test/test_input_4.txt' );
    expect( part1( data ), 2 );
  });

  //============================================================================
  test( 'part 2 invalid passports', ()
  {
    var data = readInput( 'test/test_input_4_invalid_passports.txt' );
    expect( part2( data ), 0 );
  });

  //============================================================================
  test( 'part 2 valid passports', ()
  {
    var data = readInput( 'test/test_input_4_valid_passports.txt' );
    expect( part2( data ), 4 );
  });
}