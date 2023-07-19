require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {},
    sepolia: {
      url: "https://sepolia.infura.io/v3/ce9adbc1dc7c4b2aa69a4029ea6cbe19",
      accounts: ["a45fcca65c851e8f80bd8e3b7da942f9425d11dd7983c26ca1be65140debb04b"],
      chainId: 11155111,
    },
  },
  solidity: {
    version: "0.8.1",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  etherscan: {
    apiKey: "RZA4FAXWP5HZ72TVTZWNBUS2B8YRU9ZQMV",
  },
};