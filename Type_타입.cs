using System;

namespace TestProject1
{
    internal class Type_타입
    {
        //리터럴 데이터 (Literal Data)
        //C# 에서는 문자열이나 정수에 값을 직접 선언 할 수 있는데, 이를 리터럴 타입이라고 한다.
        //별도의 접미어 표시(Suffix)가 없는 경우 컴파일러는 int, double, char, string, bool
        //데이타 타입에 기본적으로 그 값을 할당한다.따라서, 특정 데이타 타입을 지정하고 싶으면,
        //리터럴 데이타 뒤에 1~2자의 타입 지정 접미어(Suffix)를 추가해야 한다.

        // Bool
        bool b = true;

        // Numeric
        short sh = -32768;
        int i = 2147483647;
        long l = 1234L;      // L suffix
        float f = 123.45F;   // F suffix
                             //숫자 귀에 F를 붙혀 doudle이 아닌 float 타입임을 나타낸다.

        double d1 = 123.45;
        double d2 = 123.45D; // D suffix
        //D를 붙이거나 혹은 아무것도 붙이지 않아 double 타입임을 나타낸다.

        decimal d = 123.45M; // M suffix
        //M를 붙여 decimal 타입임을 나타낸다.

        // Char/String
        char c = 'A';
        //작은따옴표 ' 를 사용하여 한 문자를 할당한다.

        string s = "Hello";
        //큰따옴표 " 를 사용하여 문자열을 할당한다.

        // DateTime  2011-10-30 12:35
        DateTime dt = new DateTime(2011, 10, 30, 12, 35, 0);

        //최대값, 최소값?
        //데이터 형은 그 형에 들어 갈 수 있는 최대, 최소값이 정해져있다.
        int i2 = int.MaxValue;
        float f2 = float.MinValue;

        // Nullable 타입
        //정수(int)나 날짜(DateTime)와 같은 Value Type은 일반적으로 NULL을 가질 수 없다.
        //하지만 2.0버저 부터 NULL을 가질 수 있게 하였는데, 이를 Nullable Type 이라 부른다.
        int? N1 = null;
        Nullable<int> N2 = null;

    }
}
