import 'package:petitparser/petitparser.dart';
import 'dart:io';

//==============================================================================
class Passport
{
  Map<String, String> fields;

  //============================================================================
  Passport( Map<String, String> fields )
  {
    this.fields = fields;
  }

  //============================================================================
  bool isValid( List<String> keys )
  {
    for( var key in keys )
    {
      if( !fields.containsKey( key ) )
      {
        return false;
      }
    }
    return true;
  }
}

//==============================================================================
Map<String, String> getPassportFieldsFromParsed( List<List<dynamic>> parsed )
{
  var fields = <String, String>{};

  for( var field in parsed )
  {
    var key = field[0].toString();
    var value = field[2].toString();
    fields[key] = value;
  }
 
  print( fields );
  return fields;
}

//==============================================================================
List<Passport> getPassports( List<String> passport_db )
{
  final passport_parser = (word().star().flatten() & char(':') & 
      (word().or(char( '#' )).star()).flatten().trim()).star();

  var passports = <Passport>[];

  for( var p in passport_db )
  {
    var matches = passport_parser.parse( p ).value;
    var fields = getPassportFieldsFromParsed( matches );
    var passport = Passport( fields );
    passports.add( passport );
  }

  return passports;
}

//==============================================================================
int part1( List<String> passport_db )
{
  var num_valid = 0;
  var passports = getPassports( passport_db );
  var keys = <String>['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'];

  for( var passport in passports )
  {
    if( passport.isValid( keys ) )
    {
      num_valid++;
    }
  }

  return num_valid;
}

//==============================================================================
List<String> readInput( var filename )
{
  var file = File( filename );
  var lines = file.readAsLinesSync();
  var passport_data = <String>[];
  var temp = '';

  for( var line in lines )
  {
    if( line.isEmpty )
    {
      passport_data.add( temp );
      temp = '';
    }
    else
    {
      temp += line;
      temp += ' ';
    }
  }

  if( temp.isNotEmpty )
  {
    passport_data.add( temp );
  }

  print( passport_data );
  return passport_data;
}

//==============================================================================
void main()
{
  var input1 = readInput( 'input_4.txt' );
  var num_valid = part1( input1 );
  print( 'Part 1 result: $num_valid' );
}
