# Circuit Gates-Zvkm

## Project Overview

In this project, you'll learn how to code circuits involving logic gates like AND, NOT, and OR using the circom programming language. We'll also cover how to deploy a verifier contract on a testnet like [Amoy](https://amoy.polygonscan.com/) and generate proof for specific inputs, which can then be verified using the deployed verifier.

## Description

This project provides all the essential resources for getting started with circom programming for zkSNARK circuits. We'll walk through the logic behind each gate used in the circuit, as well as their unique characteristics:

1. AND Gate (andGate): 
   The AND gate takes two inputs (A, B) and produces an output (X) based on the following logic:

     A and B => X
   1 and 0 => 0
   1 and 1 => 1
   0 and 0 => 0
   0 and 1 => 0
   
2. NOT Gate (notGate): 
   The NOT gate takes a single input (A) and produces an output (X) as follows:

     A => X
   1 => 0
   0 => 1
   
3. OR Gate (orGate):
   The OR gate takes two inputs (A, B) and gives an output (X) based on the following logic:

     A or B => X
   1 or 0 => 1
   1 or 1 => 1
   0 or 0 => 0
   0 or 1 => 1
   
These gates form the foundation of the circuit you'll be working with. The circuit diagram can be seen below:

![Circuit Diagram](https://authoring.metacrafters.io/assets/cms/Assessment_b05f6ed658.png?updated_at=2023-02-24T00:00:37.278Z)

### Circuit Templates

To create the gates in this circuit, we’ll be using pre-made templates from [circomlib](https://github.com/iden3/circomlib).

## Getting Started

### Setting Up

To kick things off, you'll need to set up your development environment with the necessary tools:

* IDE Options: You can use an offline IDE like [VSCode](https://code.visualstudio.com/download), or online IDEs such as [Remix](https://remix.ethereum.org/) or [Gitpod](https://gitpod.io/).

* Dependencies Installation:
  - Hardhat: Install from [here](https://hardhat.org/).
  - Node.js: Install the latest version from [here](https://nodejs.org/en/download/current).

Once your setup is complete, you're ready to start designing your circuit using the various gate templates provided by [circomlib](https://github.com/iden3/circomlib).

### Installation

1. Cloning the Project: 
   Start by cloning the project template circuit files, or if you prefer to start fresh, you can use this [template](https://github.com/gmchad/zardkat).

2. Securing Private Keys:
   Set up an .env file to keep your private keys secure. Install the necessary package by following the instructions [here](https://www.npmjs.com/package/dotenv).

3. Configuring the Testnet:
   Update the circuits.config.json with your testnet details. Guidance can be found [here](https://hardhat.org/tutorial/deploying-to-a-live-network).

4. Funding Your Wallet:
   Ensure you have test MATIC in your wallet. If you don't, you can get some for free from the [Polygon Faucet](https://faucet.polygon.technology/).

5. Setting Up Environment Variables:
   Add your PRIVATE KEY to the .env.example file by replacing 'Your Key Here'. Then, rename the file from .env.example to .env.

### Running the Program

1. Install npm Dependencies:
     npm i
      
2. Compile the Circuit:
     npx hardhat circom
      This command will generate the out directory with circuit intermediaries and produce the MultiplierVerifier.sol contract.

3. Input Data Configuration:
   Provide input data for the AND gate by editing the input.json file:
     {
     "a": "0",
     "b": "1"
   }
      This input will be used when generating the proof.

4. Deploying and Verifying:
   Finally, deploy your verifier to the Amoy testnet and verify your proof:
     npx hardhat run scripts/deploy.ts --network amoy
      This script performs the following:
   1. Deploys the MultiplierVerifier.sol contract to the Amoy testnet.
   2. Generates a proof from the circuit intermediaries using the input (0,1).
   3. Creates calldata with generateCallData().
   4. Verifies the proof on the deployed verifier contract using the generated calldata.
You can verify your contract deployment by checking your contract ID on [Amoy Testnet Polyscan](https://amoy.polygonscan.com/).

### Directory Structure

circuits
├── multiplier
│   ├── circuit.circom
│   ├── input.json
│   └── out
│       ├── circuit.wasm
│       ├── multiplier.r1cs
│       ├── multiplier.vkey
│       └── multiplier.zkey
├── new-circuit
└── powersOfTau28_hez_final_12.ptau
Each circuit resides in its own directory. The top level contains the circom circuit and its input. The out directory, generated after compiling, stores outputs, keys, and proofs. The Powers of Tau file, from the Polygon Hermez ceremony, eliminates the need for a new ceremony.

contracts
contracts
└── MultiplierVerifier.sol
Verifier contracts are autogenerated and prefixed with the circuit name, like Multiplier in this case.

## Help

This project is straightforward with just two main commands. However, you might encounter errors due to incorrect syntax in circom programming, so be sure to double-check your code. If you run into any issues or need assistance, don't hesitate to reach out to me at naveenvinu5638@gmail.com.

## Authors

Naveen Vinu

(naveenvinu5638@gmail.com)

## License

This project is licensed under the [Naveen] License. See the LICENSE.md file for more details.
