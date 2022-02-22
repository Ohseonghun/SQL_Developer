//C# 상수
//상수는 C# 키워드 const를 사용하여 정의한다.
//C# 변수와 비슷하게 선언하는데, 다만 앞에 const를 붙여 상수임을 나타낸다.
//상수는 초기에 정한 값을 중간에 변경할 수 없다.

namespace basicGrammar
{
    internal class CSVar1_상수
    {
        // 상수 선언
        const int MAX_VALUE = 1024;

        // readonly 필드 
        //readonly 키워드를 사용하여 읽기전용 필드를 만들 수 있다.

        readonly int Max;
        public CSVar1_상수()
        {
            Max = 1;
        }

    }
}
