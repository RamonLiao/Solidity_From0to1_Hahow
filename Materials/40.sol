pragma solidity ^0.4.4;

contract class40{
    //使用 https://www.myetherwallet.com/signmsg.html  
    //驗證數據
    // -------------------------------------------------
    // with content & signed outcome -> who signed
    // e.g. "I'm an entrepreneur.",0xb6e35b153f4e1ff2da93cee6628c1ba969577de490d5ff84c70e6e924bf87cc237a08e92dc85fb18cd8c2e05a668b4e19a85785c7fd131d5267653a28530cba21b
    //
    // Application: X signs a message and sends to the app, the app verifies the request by signed outcome and message and then transacts the X's request.
    // -----------> X could save some Gas fee. The app transacts a batch of requests through Solidity.
    // -------------------------------------------------
    function decode(string message, bytes signedString) public pure returns (address){
        bytes32  r = bytesToBytes32(slice(signedString, 0, 32));
        bytes32  s = bytesToBytes32(slice(signedString, 32, 32));
        byte  v = slice(signedString, 64, 1)[0];
        return ecrecoverDecode(message, r, s, v);
    }
  
    //使用ecrecover找到公鑰證明是由本人簽發
    function ecrecoverDecode(string message, bytes32 r, bytes32 s, byte v1) public pure returns (address addr){
        uint8 v = uint8(v1);
        bytes memory prefix = "\x19Ethereum Signed Message:\n20"; // '\n' + the number of length of message
        bytes32 prefixedHash = keccak256(abi.encodePacked(prefix, message));
        addr = ecrecover(prefixedHash, v, r, s);
    } 

    //切割工具
    function slice(bytes memory data, uint start, uint len) internal pure returns (bytes){
        bytes memory b = new bytes(len);
            for(uint i = 0; i < len; i++){
            b[i] = data[i + start];
        }
    
        return b;
    }

    //bytes轉換bytes32
    function bytesToBytes32(bytes memory source) internal pure returns (bytes32 result) {
        assembly {
            result := mload(add(source, 32))
        }
    }
}