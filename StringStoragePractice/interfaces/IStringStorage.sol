// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IStringStorage {
    function getString() external view returns (string memory);
    function setString(string calldata _str) external;
}