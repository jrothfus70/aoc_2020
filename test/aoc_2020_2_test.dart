import '../bin/aoc_2020_2.dart';
import 'package:test/test.dart';

//==============================================================================
List<String> input = 
[ 
  '1-3 a: abcde',
  '1-3 b: cdefg',
  '2-9 c: ccccccccc'
];

void main()
{
  test('Good passwords', ()
  {
    expect( validPolicy1( '1-3 a: abcde' ), true );
    expect( validPolicy1( '2-9 c: ccccccccc' ), true );
    expect( validPolicy1( '12-15 p: zfpmpphpgghpppppppp' ), true );

    expect( validPolicy2( '1-3 a: abcde' ), true );
    expect( validPolicy2( '2-9 c: ccccccccc' ), false );
    expect( validPolicy2( '12-15 p: zfpmpphpgghpppppppp' ), false );
  });

  test('Bad passwords', ()
  {
    expect( validPolicy1( '1-3 b: cdefg', ), false );
  });
}