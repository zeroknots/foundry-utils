pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {ISignatureTransfer} from "uniswap/permit2/src/interfaces/ISignatureTransfer.sol";

contract Permit2Debug is Script {
    /**
     *
     *   struct TokenPermissions {
        // ERC20 token address
        address token;
        // the maximum amount that can be spent
        uint256 amount;
    }
    struct PermitBatchTransferFrom {
        // the tokens and corresponding amounts permitted for a transfer
        TokenPermissions[] permitted;
        // a unique value for every token owner's signature to prevent signature replays
        uint256 nonce;
        // deadline on the permit signature
        uint256 deadline;
    }
    */
    function logPermitBatchTransferFrom(
        ISignatureTransfer.PermitBatchTransferFrom memory permit
    ) public {
        console.log("\n\n----------- BATCH PERMIT ---------");
        console.log("Permit deadline: ", permit.deadline);
        console.log("Permit nonce: ", permit.nonce);
        for (uint i = 0; i < permit.permitted.length; i++) {
            console.log("Permit token %s : %s", i, permit.permitted[i].token);
            console.log("Permit amount %s : %s", i, permit.permitted[i].amount);
        }
        console.log("----------------------------------\n\n");
    }

    /**
     struct SignatureTransferDetails {
        // recipient address
        address to;
        // spender requested amount
        uint256 requestedAmount;
    }
     */
    function logSignatureTransferDetails(
        ISignatureTransfer.SignatureTransferDetails[] memory toAmountPairs
    ) public {
        console.log("\n\n----------- TRANSFER DETAILS ---------");
        for (uint i = 0; i < toAmountPairs.length; i++) {
            console.log("Transfer to %s : %s", i, toAmountPairs[i].to);
            console.log(
                "Transfer amount %s : %s",
                i,
                toAmountPairs[i].requestedAmount
            );
        }
        console.log("----------------------------------\n\n");
    }
}
