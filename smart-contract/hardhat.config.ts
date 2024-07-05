import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    hardhat: {
      chainId: 1337,
    },
    ganache: {
      url: 'http://127.0.0.1:8545',
      accounts: [''] //private wallet key use to deploie
    }
  }
};

export default config;