pragma solidity ^0.4.24;
contract class23{
        uint256 public integer_1 = 1;
        uint256 public integer_2 = 2;
        string public string_1;
    
        event setNumber(string _from);

        // //'indexed event' allows developer to filter specific data in the followinng development.
        // event Transfer(address indexed _from, address indexed _to, uint256 _amount);
  
        function function_3(string x)public {
            string_1 = x;
            emit setNumber(string_1);
        }

        
}