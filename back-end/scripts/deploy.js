const hre = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const InvoiceToken = await hre.ethers.getContractFactory("InvoiceToken");
  console.log(InvoiceToken);

  const invoiceToken = await InvoiceToken.deploy();

  await invoiceToken.waitForDeployment();

  const tokenAddress = await invoiceToken.getAddress();
  console.log(`InvoiceToken deployed to: ${tokenAddress}`);
  process.exit(0);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});