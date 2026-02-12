// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../interfaces/IStringStorage.sol";

contract StringStorage is IStringStorage {
    string private storedString;

    event Received(address indexed from, uint256 amount);

    function getString() external view override returns (string memory) {
        return storedString;
    }

    function setString(string calldata _str) external override {
        storedString = _str;
    }

    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
}