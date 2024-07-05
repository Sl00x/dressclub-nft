import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.26",
  networks: {
    hardhat: {
      chainId: 1337,
    },
    ganache: {
      url: 'http://localhost:8545',
      accounts: ['0xac8eee78eaeec76da34a2efac3aa328c9bcb365dc061ec39083bd6d29e301ff1']
    }
  }
};

export default config;
