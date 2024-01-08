// Specifies the version of Solidity, using semantic versioning.
// Learn more: https://solidity.readthedocs.io/en/v0.5.10/layout-of-source-files.html#pragma
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// Defines a contract named `HelloWorld`.
// A contract is a collection of functions and data (its state). Once deployed, a contract resides at a specific address on the Ethereum blockchain. Learn more: https://solidity.readthedocs.io/en/v0.5.10/structure-of-a-contract.html
contract Transactions {
    uint256 transactionCount;

    event Transfer(
        address from,
        address receiver,
        uint256 timestamp,
        string fullName,
        string phoneNumber,
        string deliveryAddress,
        uint256 paymentMethod,
        string items
    );

    struct OrderStruct {
        address sender;
        address receiver;
        uint256 timestamp;
        string fullName;
        string phoneNumber;
        string deliveryAddress;
        uint256 paymentMethod;
        string items;
    }

    OrderStruct[] orders;

    function addToBlockchain(
        address payable receiver,
        string memory fullName,
        string memory phoneNumber,
        string memory deliveryAddress,
        uint256 paymentMethod,
        string memory items
    ) public {
        transactionCount += 1;

        orders.push(
            OrderStruct(
                msg.sender,
                receiver,
                block.timestamp,
                fullName,
                phoneNumber,
                deliveryAddress,
                paymentMethod,
                items
            )
        );

        emit Transfer(
            msg.sender,
            receiver,
            block.timestamp,
            fullName,
            phoneNumber,
            deliveryAddress,
            paymentMethod,
            items
        );
    }

    function getAllTransactions() public view returns (OrderStruct[] memory) {
        return orders;
    }

    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }
    
}
