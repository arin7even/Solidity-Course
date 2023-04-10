// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract myToken is ERC20, Ownable {

 constructor (string memory name_, string memory symbol_) ERC20(name_, symbol_) {
     
     _mint(owner(), 21 * 1e6 * 10 ** decimals());
 }

}