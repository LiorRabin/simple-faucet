pragma solidity ^0.4.22;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';
import 'openzeppelin-solidity/contracts/token/ERC20/ERC20.sol';

contract SimpleFaucet is Ownable {
  constructor() Ownable() public {}

  address public supportedToken;
  uint256 public dropAmount = 1e18;
  uint public lastDrop;

  function setSupportedToken(address _token) public onlyOwner returns (bool) {
    require(_token != address(0));
    supportedToken = _token;
    return true;
  }

  function setGiveaway(uint256 _amount) public onlyOwner returns (bool) {
    require (_amount > 0);
    dropAmount = _amount;
    return true;
  }

  function drip() public returns (bool) {
      if (now - lastDrop < 1 minutes) {
          return false;
      }
      lastDrop = now;
      ERC20(supportedToken).transfer(msg.sender, dropAmount);
      return true;
  }
}
