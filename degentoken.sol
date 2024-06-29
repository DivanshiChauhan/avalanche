// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    
    event TokensRedeemed(address indexed user, uint256 amount, string item);

    constructor(uint256 initialSupply, address initialOwner) ERC20("DegenToken", "DGN") Ownable(initialOwner) {
        _mint(initialOwner, initialSupply);
    }

    
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    
    function decimals() public pure override returns (uint8) {
        return 0;
    }

    
    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    
    function transferTokens(address receiver, uint256 value) external {
        require(balanceOf(msg.sender) >= value, "You do not have enough Degen Tokens");
        transfer(receiver, value);
    }

    
    function redeemTokens(uint256 value, string memory item) external {
        require(balanceOf(msg.sender) >= value, "You do not have enough Degen Tokens");
        _burn(msg.sender, value);
        emit TokensRedeemed(msg.sender, value, item);
        
    }

    
    function burnTokens(uint256 value) external {
        burn(value);
    }
}
