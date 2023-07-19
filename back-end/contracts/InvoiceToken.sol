// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";

// contract InvoiceToken is ERC721 {
//     using Counters for Counters.Counter;
//     Counters.Counter private _tokenIds;

//     struct Invoice {
//         uint256 issueDate;
//         uint256 dueDate;
//         string issuingEntityName;
//         uint256 issuingEntityABN;
//         string invoiceToEntityName;
//         uint256 invoiceToEntityABN;
//         address invoiceToWalletAddress;
//         string documentHash;
//     }

//     mapping(uint256 => Invoice) private _invoices;

//     constructor() ERC721("Invoice Token", "ITK") {}

//     function issueInvoice(
//         uint256 issueDate,
//         uint256 dueDate,
//         string memory issuingEntityName,
//         uint256 issuingEntityABN,
//         string memory invoiceToEntityName,
//         uint256 invoiceToEntityABN,
//         address invoiceToWalletAddress,
//         string memory documentHash
//     ) public returns (uint256) {
//         _tokenIds.increment();
//         uint256 tokenId = _tokenIds.current();

//         _safeMint(msg.sender, tokenId);

//         Invoice storage invoice = _invoices[tokenId];
//         invoice.issueDate = issueDate;
//         invoice.dueDate = dueDate;
//         invoice.issuingEntityName = issuingEntityName;
//         invoice.issuingEntityABN = issuingEntityABN;
//         invoice.invoiceToEntityName = invoiceToEntityName;
//         invoice.invoiceToEntityABN = invoiceToEntityABN;
//         invoice.invoiceToWalletAddress = invoiceToWalletAddress;
//         invoice.documentHash = documentHash;
//         return tokenId;
//     }

//     function getInvoice(uint256 tokenId) public view returns (Invoice memory) {
//         require(_exists(tokenId), "InvoiceToken: Token ID does not exist");
//         return _invoices[tokenId];
//     }
// }

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract InvoiceToken is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct Invoice {
        string issueDate;
        string dueDate;
        string issuingEntityName;
        string issuingEntityABN;
        string invoiceToEntityName;
        string invoiceToEntityABN;
        address invoiceToWalletAddress;
    }

    mapping(uint256 => Invoice) private _invoices;

    constructor() ERC721("InvoiceToken", "ITK") {}

    function issueInvoice(
        string memory issueDate,
        string memory dueDate,
        string memory issuingEntityName,
        string memory issuingEntityABN,
        string memory invoiceToEntityName,
        string memory invoiceToEntityABN,
        address invoiceToWalletAddress
    ) external returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(invoiceToWalletAddress, newItemId);

        Invoice memory newInvoice = Invoice(
            issueDate,
            dueDate,
            issuingEntityName,
            issuingEntityABN,
            invoiceToEntityName,
            invoiceToEntityABN,
            invoiceToWalletAddress
        );
        _invoices[newItemId] = newInvoice;

        return newItemId;
    }

    function getInvoice(uint256 tokenId)
        external
        view
        returns (
            string memory issueDate,
            string memory dueDate,
            string memory issuingEntityName,
            string memory issuingEntityABN,
            string memory invoiceToEntityName,
            string memory invoiceToEntityABN,
            address invoiceToWalletAddress
        )
    {
        require(_exists(tokenId), "InvoiceToken: Invoice does not exist");

        Invoice memory invoice = _invoices[tokenId];

        return (
            invoice.issueDate,
            invoice.dueDate,
            invoice.issuingEntityName,
            invoice.issuingEntityABN,
            invoice.invoiceToEntityName,
            invoice.invoiceToEntityABN,
            invoice.invoiceToWalletAddress
        );
    }
}

//0x1a8F38eBc399aE79E93E4533A1bd07454F4110b1