pragma solidity ^0.4.24;
contract class21{

    //用陣列不僅比較好寫，也比較直觀外
    //for迴圈可以直接使用
    
    mapping (uint=>string)public mapping_1;
    uint[] public uint_array_1;

    uint a1 = 200;
    uint a2 = 200;
    uint a3 = 200;
    uint a4 = 200;
    uint a5 = 200;
    uint a6 = 200;
    uint a7 = 200;
    uint a8 = 200;
    uint a9 = 200;
    uint a10 = 200;
    uint a11 = 200;
    uint a12 = 200;

    uint[3] public uint_array_2;
    
    struct struct_1{
        uint256 id;
        uint256 price;
    }
    
    struct_1 public product_1;

    mapping(address=>struct_1) public prices_list;
    
    constructor()public{
        mapping_1[0] = 'Hello';
        mapping_1[1] = 'World';
        uint_array_1.push(10);
        uint_array_1.push(21);
        uint_array_2[0] = 45;
        uint_array_2[2] = 70;
        product_1 = struct_1(1, 199);
        mapping_1[3] = '3rd layer';

        prices_list[0x57B564B131302FD18e2FF4A0A9b746f1d19cd5aB] = product_1;
        prices_list[0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB] = struct_1(2, 499);
    }
   
    //實作array
    //實作mapping
    //實作struct
}