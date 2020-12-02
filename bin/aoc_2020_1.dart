import 'dart:io';

//============================================================================
int find2020SumOf2( Iterable<int> expense_report )
{
  var start = 0;
  var index = 1;

  while( start < expense_report.length )
  {
    while( index < expense_report.length )
    {
      var value1 = expense_report.elementAt(start);
      var value2 = expense_report.elementAt(index);
      if( value1 + value2 == 2020 )
      {
        return value1 * value2;
      }
      index++;
    }
    start++;
    index = start + 1;
  }
  return -1;
}

//============================================================================
int find2020SumOf3( Iterable<int> expense_report )
{
  var index1 = 0;
  var index2 = 1;
  var index3 = 1;

  while( index1 < expense_report.length )
  {
    while( index2 < expense_report.length )
    {
      while( index3 < expense_report.length )
      {
        var value1 = expense_report.elementAt( index1 );
        var value2 = expense_report.elementAt( index2 );
        var value3 = expense_report.elementAt( index3 );
        if( value1 + value2 + value3 == 2020 )
        {
          return value1 * value2 * value3;
        }
        index3++;
      }
      index2++;
      index3 = index2 + 1;
    }
    index1++;
    index2 = index1 + 1;
    index3 = index2 + 1;
  }
  return -1;
}

//==============================================================================
Iterable<int> ReadInput( var filename )
{
  var file = File( filename );
  var lines = file.readAsLinesSync();
  return lines.map( int.parse );
}

//==============================================================================
void main(List<String> arguments) 
{
  var input = ReadInput( 'input_1.txt' );
  var result1 = find2020SumOf2( input );
  print( 'Result1: ${result1}' );
  
  var result2 = find2020SumOf3( input );
  print( 'Result2: ${result2}' );
}
