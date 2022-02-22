using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//C# 배열 (Array)
//배열은 일련의 동일한 데이타 타입 요소들로 구성된 데이타 집합으로서,
//인덱스를 통하여 개개의 배열요소(Element)를 엑세스할 수 있다.

namespace basicGrammar
{
    internal class Array_배열
    {
        // 1차 배열
        string[] players = new string[10]; 
        //최대 10개의 요소를 가질 수 있는 배열 선언
        string[] Regions = { "서울", "경기", "부산" };
        //배열 내 3개의 요소를 선언

        // 2차 배열 선언 및 초기화
        string[,] Depts = { { "김과장", "경리부" }, { "이과장", "총무부" } };
        // 3차 배열 선언
        string[,,] Cubes;

        // ',' 쉼표를 사용하여 다차원 배열을 선언 할 수 있다.
    }
}
