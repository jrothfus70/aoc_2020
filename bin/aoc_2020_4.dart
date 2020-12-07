import 'package:petitparser/petitparser.dart';
import 'dart:io';

//==============================================================================
class Passport
{
  Map<String, String> fields;
  Map<String, Function> field_checks = {};
  var required_fields = <String>['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'];

  //============================================================================
  Passport( Map<String, String> fields )
  {
    this.fields = fields;
    field_checks =
    {
      'byr' : isBirthYearValid,
      'iyr' : isIssueYearValid,
      'eyr' : isExpYearValid,
      'hgt' : isHeightValid,
      'hcl' : isHairColorValid,
      'ecl' : isEyeColorValid,
      'pid' : isPidValid,
    };
  }

  //============================================================================
  bool isValid()
  {
    if ( hasValidFields() )
    {
      for( var field in required_fields )
      {
        var value = fields[field];
        if ( !field_checks[field]( value ) )
        {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  //============================================================================
  bool hasValidFields()
  {
    for( var key in required_fields )
    {
      if( !fields.containsKey( key ) )
      {
        return false;
      }
    }
    return true;
  }

  //============================================================================
  bool isBirthYearValid( String birth_year )
  {
    var by = int.parse( birth_year );
    return by >= 1920 && by <= 2002;
  }

  //============================================================================
  bool isIssueYearValid( String issue_year )
  {
    var iy = int.parse( issue_year );
    return iy >= 2010 && iy <= 2020;
  }

  //============================================================================
  bool isExpYearValid( String exp_year )
  {
    var ey = int.parse( exp_year );
    return ey >= 2020 && ey <= 2030;
  }

  //============================================================================
  bool isHeightValid( String height )
  {
    var h = int.parse( (digit().star().flatten()).parse( height ).value );
    if( height.contains( 'cm' ) )
    {
      return h >= 150 && h <= 193;
    }
    else if( height.contains( 'in' ) )
    {
      return h >= 59 && h <= 76;
    }

    return false;
  }

  //============================================================================
  bool isHairColorValid( String hair_color )
  {
    if( hair_color.length == 7 )
    {
      if( hair_color[0] == '#' )
      {
        var color = hair_color.substring( 1 );
        final parser = word().star();
        var matches = parser.parse(color).value;
        return matches.length == 6;
      }
    }

    return false;
  }

  //============================================================================
  bool isEyeColorValid( String eye_color )
  {
    var colors = <String>[ 'amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth' ];
    
    for( var color in colors )
    {
      if( eye_color.contains( color ) )
      {
        return true;
      }
    }
    return false;
  }

  //============================================================================
  bool isPidValid( String pass_id )
  {
    final parser = digit().star();
    var matches = parser.parse( pass_id ).value;

    return matches.length == 9;
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

  for( var passport in passports )
  {
    if( passport.hasValidFields() )
    {
      num_valid++;
    }
  }

  return num_valid;
}

//==============================================================================
int part2( List<String> passport_db )
{
  var num_valid = 0;
  var passports = getPassports( passport_db );

  for( var passport in passports )
  {
    if( passport.isValid() )
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

  return passport_data;
}

//==============================================================================
void main()
{
  var input = readInput( 'input_4.txt' );
  var num_valid = part1( input );
  print( 'Part 1 result: $num_valid' );

  num_valid = part2( input );
  print( 'Part 2 result: $num_valid' );
}
