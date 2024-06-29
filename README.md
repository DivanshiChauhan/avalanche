
# DegenToken Contract

## Overview
DegenToken is an ERC20 token contract written in Solidity. It includes functionalities for minting tokens, transferring tokens, burning tokens, and redeeming tokens for specific items.

## Prerequisites

- Solidity ^0.8.26
- Remix IDE (https://remix.ethereum.org/)
- Metamask browser extension

## Contract Details

### Features
- ERC20 Standard: Implements standard ERC20 token functionalities.
- Ownable: Includes functionality for ownership management.
- ERC20Burnable: Allows burning (destroying) of tokens.

### Constructor
```solidity
constructor(uint256 initialSupply, address initialOwner) ERC20("DegenToken", "DGN") Ownable(initialOwner) {
    _mint(initialOwner, initialSupply);
}
```
- **Description**: Initializes the contract with an initial supply of DegenToken tokens, minted to the initial owner.

### Functions

#### mint
```solidity
function mint(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
}
```
- **Description**: Mints new DegenToken tokens.
- **Modifiers**: `onlyOwner` ensures only the contract owner can mint tokens.

#### transferTokens
```solidity
function transferTokens(address receiver, uint256 value) external {
    require(balanceOf(msg.sender) >= value, "You do not have enough Degen Tokens");
    transfer(receiver, value);
}
```
- **Description**: Transfers DegenToken tokens to another address.

#### redeemTokens
```solidity
function redeemTokens(uint256 value, string memory item) external {
    require(balanceOf(msg.sender) >= value, "You do not have enough Degen Tokens");
    _burn(msg.sender, value);
    emit TokensRedeemed(msg.sender, value, item);
}
```
- **Description**: Burns DegenToken tokens and emits an event for token redemption.

#### burnTokens
```solidity
function burnTokens(uint256 value) external {
    burn(value);
}
```
- **Description**: Burns DegenToken tokens.

### Events
- `TokensRedeemed`: Triggered when tokens are redeemed for an item.

## Usage

1. **Deploy Contract**:
   - Use Remix IDE to deploy the DegenToken contract.
   - Select "Injected Web3" environment in Remix to connect Metamask.

2. **Confirm Transactions**:
   - Confirm transactions in Metamask to deploy and interact with the contract.

3. **Snowtrace Transaction Confirmation**:
   - Copy the contract address to Snowtrace for transaction confirmation.

## Authors
Divanshi  
[DivanshiChauhan](https://github.com/DivanshiChauhan)

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.


