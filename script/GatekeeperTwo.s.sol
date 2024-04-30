// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {GatekeeperTwo} from "../src/GatekeeperTwo.sol";

contract GatekeeperTwoOpener {
    constructor() public {
        GatekeeperTwo gatekeeperTwo = GatekeeperTwo(0x33eeDC278AB1e35FC510dB4404D1Bc4c64210bEF);
        bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(this)))) ^ uint64(type(uint64).max));
        gatekeeperTwo.enter(gateKey);
    }
}

contract GatekeeperTwoScript is Script {
    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        GatekeeperTwoOpener getKeeperTwoOpener = new GatekeeperTwoOpener();
        vm.stopBroadcast();
    }
}
