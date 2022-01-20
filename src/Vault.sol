// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.11;

import { ERC20 } from 'solmate/tokens/ERC20.sol';

contract Vault is ERC20 {

    address immutable controller;

    uint256 public fee;

    uint256 public maxFee;

    uint256 public basePrice;

    uint256 public reservePrice;

    uint256 public supply;

    bool public isInitialized;


    constructor(address _controller, string memory _name, string memory _symbol) ERC20(_name, _symbol, 18) {
        controller = _controller;
        isInitialized = false;
    }

    function init(uint256 _fee, uint256 _basePrice, uint256 _reservePrice) public {
        require(msg.sender == controller && isInitialized == false && _fee < maxFee);

        fee = _fee;
        basePrice = _basePrice;
        reservePrice = _reservePrice;

        isInitialized = true;
    }

    function fractionalize() public {}

    function startAuction() public {}

    function bid() public {}

    function claimFees() public {}

    function updateFee(uint256 _newFee) public {
        require(msg.sender == controller && _newFee < maxFee);

        fee = _newFee;
    }

}
