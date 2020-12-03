import 'package:petitparser/petitparser.dart';
import 'dart:io';

//==============================================================================
//Could not get String::allMatches to work??
int passCharCount( String password, String character )
{
  var count = 0;

  for ( var c in password.split('') )
  {
    if( c == character )
    {
      count++;
    }
  }
  return count;
}


//==============================================================================
bool validPolicy1( String password_policy )
{
  final password_parser = digit().star().flatten() & char( '-' ) & digit().star().trim().flatten() & letter() & char(':').trim() & word().star().flatten();
  var matches = password_parser.parse( password_policy ).value;
  var min = int.parse( matches.elementAt(0) );
  var max = int.parse( matches.elementAt(2) );
  var pass_char = matches.elementAt(3);
  var password = matches.elementAt(5);

  var count = passCharCount( password, pass_char );

  return (count >= min && count <= max);
}

//==============================================================================
bool validPolicy2( String password_policy )
{
  final password_parser = digit().star().flatten() & char( '-' ) & digit().star().trim().flatten() & letter() & char(':').trim() & word().star().flatten();
  var matches = password_parser.parse( password_policy ).value;
  var first_pos = int.parse( matches.elementAt(0) );
  var second_pos = int.parse( matches.elementAt(2) );
  var pass_char = matches.elementAt(3);
  var password = matches.elementAt(5);

  
  return ( (password[first_pos - 1] == pass_char) !=
    (password[second_pos - 1] == pass_char) );
}

//==============================================================================
List<String> ReadInput( var filename )
{
  var file = File( filename );
  var lines = file.readAsLinesSync();
  return lines;
}


void main()
{
  var input = ReadInput( 'input_2.txt' );
  var valid_count = 0;

  for( var password_policy in input )
  {
    if( validPolicy1( password_policy ) )
    {
      valid_count++;
    }
  }
  
  print( 'Part 1' );
  print( 'Valid passwords: ${valid_count}' );
  print( 'Invalid passwords: ${input.length - valid_count}' );

  valid_count = 0;
  for( var password_policy in input )
  {
    if( validPolicy2( password_policy ) )
    {
      valid_count++;
    }
  }

  print( 'Part 2' );
  print( 'Valid passwords: ${valid_count}' );
  print( 'Invalid passwords: ${input.length - valid_count}' );
}
