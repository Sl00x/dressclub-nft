// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
// import "hardhat/console.sol";

contract Demo {
    string public message;

    constructor(string memory _msg) {
        message = _msg;
    }

    function setMessage(string memory _msg) public {
        message = _msg;
    }

    function getMessage() public view returns(string memory) {
        return message;
    }

}
