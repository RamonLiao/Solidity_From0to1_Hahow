pragma solidity >=0.4.22 <0.7.0;

contract Practice {
        uint256 a1;
        uint256 a2;
        uint256 a3;
        uint256 a4 = 0;
        uint256 a5 = 10;

        bool c1;
        bool c2;
        bool c3;

        bool g1;
        bool g2;
        bool g3 = false;

        //以上為初始值專區

         //下面才是計算
     function arithmetic_operator () public {  //算術運算子 練習
            a1 = 5 + 3;
            a2 = 2 ** 3 + 2;
            a3 = 5 / (2 + 3);
            a4 += 5;
            a5--;
     }
 
    function comparison_operator () public {  //比較運算子 練習
            c1 = 5 >= 5;
            c2 = 100 * 2 > 200;
            c3 = 5 ** 2 == 25;
     }    

    function logical_operator () public {  //算術運算子 練習
            g1 = 3**2 > 5 && false;
            g2 = 3 < 5 || 2 > 6;
            g3 = !g3;
    }
}