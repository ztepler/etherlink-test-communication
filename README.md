# Simple contract interaction example

This repository reproduces an example of interaction between contracts in Etherlink which finished with error.

This repository contains two simple smart contracts written in solidity:
- Counter: which allows to setNumber to any uint256 and increment number
- Caller: which allows to setNumber for a given counter contract providing its address as one of the parameters

To use this repository, you need to install foundry: https://github.com/foundry-rs/foundry

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Deploy in Etherlink
```shell
$ forge create --legacy --rpc-url https://evm.ghostnet-evm.tzalpha.net/ --private-key <your_private_key> src/Counter.sol:Counter --gas-limit 100000
$ forge create --legacy --rpc-url https://evm.ghostnet-evm.tzalpha.net/ --private-key <your_private_key> src/Caller.sol:Caller --gas-limit 100000
```
After deploy you will get your `caller_address` and `counter_address`. Here is some contracts that already deployed in Etherlink:
* Counter: [0x833696e136d0A66206615a5f84F4097F1c8802F8](https://explorer.ghostnet-evm.tzalpha.net/address/0x833696e136d0A66206615a5f84F4097F1c8802F8)
* Caller: [0xc7D3B0d10151054831561B8e868467a8CFE0BaC0](https://explorer.ghostnet-evm.tzalpha.net/address/0xc7D3B0d10151054831561B8e868467a8CFE0BaC0)

### Communicate
```shell
cast send <caller_address> "setNumber(address, uint256)" <counter_address> 420 --rpc-url https://evm.ghostnet-evm.tzalpha.net/ --private-key <your_private_key> --legacy --gas-limit 300000
```

Example with deployed caller and counter:
```
cast send 0xc7D3B0d10151054831561B8e868467a8CFE0BaC0 "setNumber(address, uint256)" 0x833696e136d0A66206615a5f84F4097F1c8802F8 420 --rpc-url https://evm.ghostnet-evm.tzalpha.net/ --private-key <your_private_key> --legacy --gas-limit 300000
```

Example of failed transaction with this parameters: [0x5a03681eb2c5955748a5c3a6915ee11b6a0f421ec97e125e217aba9a870a1a98](https://explorer.ghostnet-evm.tzalpha.net/tx/0x5a03681eb2c5955748a5c3a6915ee11b6a0f421ec97e125e217aba9a870a1a98)

