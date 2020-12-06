import 'dart:io';
import 'package:ml_linalg/linalg.dart';

//==============================================================================
class Pair<T1, T2>
{
  var val1;
  var val2;
  Pair( v1, v2 ) : val1 = v1, val2 = v2;
}

//==============================================================================
List<String> ReadInput( var filename )
{
  var file = File( filename );
  var lines = file.readAsLinesSync();
  return lines;
}

//==============================================================================
int countTrees( Pair<int, int> slope, List<String> map )
{
  var num_trees = 0;
  var map_width = map[0].length;
  var map_height = map.length;
  var map_x = slope.val1;
  var map_y = slope.val2;

  // print( 'Height: ${map_height}');
  // print( 'Width: ${map_width}' );

  while( map_y < map_height )
  {
    // print( 'X: ${map_x}' );
    // print( 'Y: ${map_y}' );
    if( map[map_y][map_x] == '#' )
    {
      num_trees++;
//      print( 'Tree' );
    }

    map_x += slope.val1;
    map_x %= map_width;

    map_y += slope.val2;
    if( map_y > map_height )
    {
       break;
    }
  }

  return num_trees;
}

//==============================================================================
int part1( var slope, var map )
{
  return countTrees( slope, map );
}

//==============================================================================
int part2( List<Pair<int, int>> slopes, var map )
{
  List<int> trees = [];

  for( var slope in slopes )
  {
    trees.add( countTrees( slope, map) );
  }

  var vec = Vector.fromList( trees );
  return vec.prod().toInt();
}

//==============================================================================
void main()
{
  var slope = Pair<int, int>( 3, 1);
  var map = ReadInput( 'input_3.txt' );
  var num_trees = part1( slope, map );
  print( 'Part 1 Result: $num_trees' );

  List<Pair<int,int>> slopes = 
  [
    Pair( 1,1 ),
    Pair( 3,1 ),
    Pair( 5,1 ),
    Pair( 7,1 ),
    Pair( 1,2 ),
  ];

  var product_of_trees = part2( slopes, map );
  print( 'Part 2 Result: $product_of_trees' );
}
