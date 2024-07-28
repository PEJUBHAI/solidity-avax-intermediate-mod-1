# Simple Storage

A Solidity smart contract for storing, retrieving, increasing, and decreasing a stored data value.

## Description

This Solidity program demonstrates a basic smart contract called `SimpleStorage`. The contract allows you to store, retrieve, increase, and decrease a uint256 value. It includes basic validation to ensure that increases are positive and decreases do not result in negative values.

## Getting Started

### Installing

To run this program, you can use Remix, an online Solidity IDE.

1. Go to the Remix website at [Remix Ethereum](https://remix.ethereum.org/).
2. Create a new file by clicking on the "+" icon in the left-hand sidebar.
3. Save the file with a `.sol` extension (e.g., `SimpleStorage.sol`).

### Executing program

1. Copy and paste the following code into the file:

```// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 public storedData = 1000;

    // Get the stored data value
    function get() public view returns (uint256) {
        return storedData;
    }

    // Increase the stored data value
    function increase(uint256 amount) public {
        require(amount > 0, "Increase amount must be positive"); // Use require for validation
        uint256 newValue = storedData + amount;
        
        // Use assert to ensure no overflow happens
        assert(newValue > storedData);

        storedData = newValue;
    }

    // Decrease the stored data value
    function decrease(uint256 amount) public {
        if (storedData < amount) {
            revert("Insufficient stored data"); // Use revert to handle errors
        }
        storedData -= amount;
    }
}```

2. Compile the code:
    - Click on the "Solidity Compiler" tab in the left-hand sidebar.
    - Ensure the "Compiler" option is set to "0.8.0" (or another compatible version).
    - Click on the "Compile SimpleStorage.sol" button.

3. Deploy the contract:
    - Click on the "Deploy & Run Transactions" tab in the left-hand sidebar.
    - Select the "SimpleStorage" contract from the dropdown menu.
    - Click on the "Deploy" button.

4. Interact with the deployed contract:
    - Click on the deployed `SimpleStorage` contract in the left-hand sidebar.
    - Call the `get`, `set`, `increase`, and `decrease` functions as needed.

## Help

If you encounter any issues, make sure your Solidity version is compatible and that you've followed the steps correctly.

## Authors

Shawaiz Islam
shawaizjutt978@gmail.com

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.