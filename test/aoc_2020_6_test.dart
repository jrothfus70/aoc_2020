import 'package:test/test.dart';
import '../bin/aoc_2020_6.dart';


//==============================================================================
void main()
{
  var input = readInput( 'test/test_input_6.txt' );
  //============================================================================

  test( 'Parse Groups', () 
  {
    var groups = parseGroups( input );
    expect( groups.length, 5 );
  });

  test( 'Number of Unique Yes Answers', () 
  {
    var groups = parseGroups( input );
    var answers = getNumUniqueYesAnswers( groups );
    expect( answers, 11 );
  });

  test( 'All yes answers', () 
  {
    var groups = parseGroups( input );
    var answers = getNumAllYesAnswers( groups );
    expect( answers, 6 );
  });
}