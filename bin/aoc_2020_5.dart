import 'dart:io';


//==============================================================================
int findRow( String seat_code )
{
  var min_row = 0;
  var row_code = seat_code.substring( 0, 7 );
  var divider = 64;

  for( var i = 0; i < 7; i++ )
  {
    if( row_code[i] == 'B' )
    {
      min_row += divider;
    }
    divider >>= 1;
  }
  
  return min_row;
}

//==============================================================================
int findColumn( String seat_code )
{
  var min_col = 0;
  var row_code = seat_code.substring( 7 );
  var divider = 4;

  for( var i = 0; i < 3; i++ )
  {
    if( row_code[i] == 'R' )
    {
      min_col += divider;
    }
    divider >>= 1;
  }
  
  return min_col;
}

//==============================================================================
int findSeatId( String seat_code )
{
  return findRow( seat_code ) * 8 + findColumn( seat_code );
}

//==============================================================================
List findSeatIds( List<String> boarding_passes )
{
  var seat_ids = [];

  for( var seat_code in boarding_passes )
  {
    seat_ids.add( findSeatId( seat_code ) );
  }

  return seat_ids;
}

//==============================================================================
int findMaxSeatId( List<String> boarding_passes )
{
  var seat_ids = findSeatIds( boarding_passes );
  seat_ids.sort();
  return seat_ids.last;
}

//==============================================================================
int findMySeatId( List<String> boarding_passes )
{
  var seat_ids = findSeatIds( boarding_passes );
  seat_ids.sort();

  var all_seat_ids = [ for( var i = seat_ids.first; i <= seat_ids.last; i++) i];
  all_seat_ids.removeWhere( (element) => seat_ids.contains(element) );
  return all_seat_ids.last;
}

//==============================================================================
List<String> readInput( var filename )
{
  var file = File( filename );
  var lines = file.readAsLinesSync();
  return lines;
}

//==============================================================================
void main()
{
  var input = readInput( 'input_5.txt' );
  var max_id = findMaxSeatId( input );
  print( 'Part 1 result: $max_id' );

  var my_id = findMySeatId( input  );
  print( 'Part 2 result: $my_id' );
}
