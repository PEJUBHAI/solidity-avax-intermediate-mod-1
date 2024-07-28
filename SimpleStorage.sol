// SPDX-License-Identifier: MIT
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
}