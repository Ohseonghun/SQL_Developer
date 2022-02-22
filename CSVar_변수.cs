//C# 변수
//변수는 메서드 안에서 해당 메서드의 로컬변수로 선언되거나,
//혹은 클래스 안에서 클래스 내의 멤버들이 사용하는 전역적 변수(Field)로 선언될 수 있다.

namespace TestProject1
{   
    internal class CSVar_변수
    {
        //필드 변수(클래스 내에서 계속 사용 될 수 있는 전역 변수,상수)
        int globalVar;
        const int MAX = 1024;
        //필드 globalVar는 값을 명시적으로 할당하지 않은 경우 기본값 0 이 할당된다.

        public void Method1()
        {
            //로컬변수 (해당 메서드내에서만 사용되며, 메서드 호출이 끝나면 소멸)
            int localVar;
            localVar = 100;
            //지역변수 localVar는 값을 할당하지 않고 사용하면, 컴파일러 에러가 발생한다

            Console.WriteLine(globalVar);
            Console.WriteLine(localVar);

        }

        class Program
        {
            // 모든 프로그램에는 Main()이 있어야 함.
            static void Main(string[] args)
            {
                // 테스트
                CSVar_변수 obj = new CSVar_변수();
                obj.Method1();
            }


        }
    }
}
