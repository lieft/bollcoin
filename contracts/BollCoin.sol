// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract BollCoin is ERC20, Ownable {
    constructor() ERC20("BollCoin", "BOL") Ownable(msg.sender) {
        _mint(msg.sender, 1000000000000 * 10 ** decimals());
    }
    function distributeTokensBatch(address[] memory recipients, uint256[] memory amounts) public onlyOwner {
        require(recipients.length == amounts.length, "Mismatched arrays");
        require(recipients.length <= 100, "Too many recipients");
        uint256 totalAmount = 0;
        for (uint256 i = 0; i < recipients.length; i++) {
            _transfer(msg.sender, recipients[i], amounts[i]);
            totalAmount += amounts[i];
        }
        emit BatchDistributed(recipients.length, totalAmount);
    }
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    event BatchDistributed(uint256 totalRecipients, uint256 totalAmount);
}