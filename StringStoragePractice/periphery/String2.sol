// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../interfaces/IStringStorage.sol";

contract StringStorageForExternalAccount {

    address public stringStorageAddress;
    constructor(address _stringStorageAddress) {
        stringStorageAddress = _stringStorageAddress;
    }

    function getString() external view returns (string memory){
        return IStringStorage(stringStorageAddress).getString();
    }
    function setString(string calldata _newString) external {
        IStringStorage(stringStorageAddress).setString(_newString);
    }
}
