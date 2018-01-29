pragma solidity^0.4.0;

contract game{
    
    address public player;
    uint public playerMoney;
    uint _incre;
    uint public num;
    uint public color;
    
    
    
    mapping(address => uint) MoneyX;
    
    
    function game(){
        player = msg.sender;
        playerMoney = msg.value;
    }
    
    
    function pay() payable{
        if(msg.value > playerMoney) {
            MoneyX[player] += msg.value;
            player = msg.sender;
            playerMoney = msg.value;
        }

    }
    
    function random() returns (uint) {
        
        num = uint(((block.blockhash(block.number-1) ^(sha3(_incre++))))) %10;
        color = uint(((block.blockhash(block.number-1) ^(sha3(_incre++))))) % 3;
        
        
        
    }
    
    
    
    function WinOrLost(uint n, uint c) returns (bool) {
        
        if((num == n) && (color ==c)) {
            
            uint val = MoneyX[msg.sender];
            MoneyX[msg.sender] = 0;
            msg.sender.transfer(val);
        
            
        }
    }
    
    
}
