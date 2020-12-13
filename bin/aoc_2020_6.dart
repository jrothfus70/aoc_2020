import 'dart:io';



//==============================================================================
List<String> readInput( var filename )
{
  var file = File( filename );
  var lines = file.readAsLinesSync();
  return lines;
}

//==============================================================================
class Group
{
  List<String> questions = [
    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s',
    't','u','v','w','x','y','z'
  ];
  List<String> answers = [];
  
  //============================================================================
  void addAnswer( String answer )
  {
    answers.add( answer );
  }
  
  //============================================================================
  int uniqueYesAnswers()
  {
    var all_answers = answers.reduce( (prev, element) => prev + element );
    var count = 0;
    for( var question in questions )
    {
      count += all_answers.contains( question ) ? 1: 0;
    }

    return count;
  }

  //============================================================================
  int allAnsweredYes()
  {
    if( answers.length == 1 )
    {
      return answers[0].length;
    }

    var yes_count = 0;
    for( var question in questions )
    {
      var person_count = answers.length;

      for( var answer in answers )
      {
        if( answer.contains( question ) )
        {
          --person_count;
        }
        else
        {
          break;
        }
      }

      if( person_count == 0 )
      {
        yes_count++;
      }
    }
    return yes_count;
  }
}

//==============================================================================
List<Group> parseGroups( List<String> input )
{
  List<Group> groups = [];
  var current_group = Group();

  for( var line in input )
  {
    if( line.isNotEmpty )
    {
      current_group.addAnswer( line );
    }
    else
    {
      groups.add( current_group );
      current_group = Group();
    }
  }

  groups.add( current_group );
  return groups;
}

//==============================================================================
int getNumUniqueYesAnswers( List<Group> groups )
{
  var count = 0;

  for( var group in groups )
  {
    count += group.uniqueYesAnswers();
  }

  return count;
}

//==============================================================================
int getNumAllYesAnswers( List<Group> groups )
{
  var count = 0;
  for( var group in groups )
  {
    count += group.allAnsweredYes();
  }

  return count;
}

//==============================================================================
void main()
{
  var input = readInput( 'input_6.txt' );
  var groups = parseGroups( input );
  var numYes = getNumUniqueYesAnswers( groups );
  print( 'Part 1 result: $numYes' );

  var numAllYes = getNumAllYesAnswers( groups );
  print( 'Part 1 result: $numAllYes' );
}
