# SimplePokemonGame

A Solidity smart contract for managing a basic Pokemon game. This contract allows you to store and interact with a small team of Pokemon, adjust their trust levels based on the fruit they are fed, and reset them if their trust level falls below zero.

## Description

This Solidity program defines a smart contract called `SimplePokemonGame`. The contract manages a team of three Pokemon, each with a name and a trust level. It includes functions to feed a Pokemon, adjust its trust level based on the type of fruit given, and retrieve the Pokemon's current trust level. If a Pokemon's trust level drops below zero, it is reset.

## Getting Started

### Installing

To run this program, you can use Remix, an online Solidity IDE.

1. Go to the Remix website at [Remix Ethereum](https://remix.ethereum.org/).
2. Create a new file by clicking on the "+" icon in the left-hand sidebar.
3. Save the file with a `.sol` extension (e.g., `SimplePokemonGame.sol`).

### Executing program

1. Copy and paste the following code into the file:
 ```sol
 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimplePokemonGame {
    // Struct to hold Pokemon data
    struct Pokemon {
        string name;  // Pokemon's name
        int trustLevel;  // Trust level of the Pokemon
    }

    // Array to store 3 Pokemon
    Pokemon[3] public pokemons;

    // Constructor to initialize the array with 3 Pokemon
    constructor() {
        pokemons[0] = Pokemon("Pikachu", 75);
        pokemons[1] = Pokemon("Charmander", 50);
        pokemons[2] = Pokemon("Crustle", 25);
    }

    // Function to feed a Pokemon with a fruit
    function feedPokemon(uint pokemonIndex, string memory fruit) public {
        require(pokemonIndex < pokemons.length, "Invalid Pokemon index");  // Check if index is valid
        require(bytes(pokemons[pokemonIndex].name).length > 0, "No Pokemon in the team");  // Check if Pokemon exists

        // Check which fruit is given and adjust trust level
        if (compareStrings(fruit, "apple")) {
            pokemons[pokemonIndex].trustLevel += 5;  // Increase trust level if fruit is apple
        } else if (compareStrings(fruit, "orange")) {
            pokemons[pokemonIndex].trustLevel -= 5;  // Decrease trust level if fruit is orange
        } else {
            revert("Unknown fruit");  // If fruit is neither apple nor orange, show an error
        }

        // Ensure trust level is between 0 and 100
        assert(pokemons[pokemonIndex].trustLevel >= 0 && pokemons[pokemonIndex].trustLevel <= 100);

        // If trust level is below 0, reset the Pokemon
        if (pokemons[pokemonIndex].trustLevel < 0) {
            resetPokemon(pokemonIndex);
        }
    }

    // Internal function to reset a Pokemon
    function resetPokemon(uint pokemonIndex) internal {
        require(pokemonIndex < pokemons.length, "Invalid Pokemon index");  // Check if index is valid
        pokemons[pokemonIndex] = Pokemon("", 0);  // Clear Pokemon's name and set trust level to 0
    }

    // Function to get a Pokemon's trust level
    function getPokemonTrustLevel(uint pokemonIndex) public view returns (int) {
        require(pokemonIndex < pokemons.length, "Invalid Pokemon index");  // Check if index is valid
        require(bytes(pokemons[pokemonIndex].name).length > 0, "No Pokemon in the team");  // Check if Pokemon exists
        return pokemons[pokemonIndex].trustLevel;  // Return the trust level
    }

    // Internal function to compare two strings
    function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return (bytes(a).length == bytes(b).length) && (compareBytes(bytes(a), bytes(b)));
    }

    // Internal function to compare two byte arrays
    function compareBytes(bytes memory a, bytes memory b) internal pure returns (bool) {
        if (a.length != b.length) {
            return false;  // If lengths are different, strings are not equal
        }

        for (uint i = 0; i < a.length; i++) {
            if (a[i] != b[i]) {
                return false;  // If any byte is different, strings are not equal
            }
        }

        return true;  // Strings are equal
    }
}
```
2. Compile the code:
    - Click on the "Solidity Compiler" tab in the left-hand sidebar.
    - Ensure the "Compiler" option is set to "0.8.0" (or another compatible version).
    - Click on the "Compile SimplePokemonGame.sol" button.

3. Deploy the contract:
    - Click on the "Deploy & Run Transactions" tab in the left-hand sidebar.
    - Select the "SimplePokemonGame" contract from the dropdown menu.
    - Click on the "Deploy" button.

4. Interact with the deployed contract:
    - Click on the deployed `SimplePokemonGame` contract in the left-hand sidebar.
    - Call the `feedPokemon`, `getPokemonTrustLevel`, and other functions as needed.

## Help

If you encounter any issues, make sure your Solidity version is compatible and that you've followed the steps correctly.

## Authors

Shawaiz Islam

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
