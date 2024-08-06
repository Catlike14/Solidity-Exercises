// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CrossContract {
    /**
     * The function below is to call the price function of PriceOracle1 and PriceOracle2 contracts below and return the lower of the two prices
     */

    function getLowerPrice(
        address priceOracle1,
        address priceOracle2
    ) external returns (uint256) {
        bytes memory encoded = abi.encodeWithSignature("price()");
        (bool ok1, bytes memory price1Bytes) = priceOracle1.call(encoded);
        (bool ok2, bytes memory price2Bytes) = priceOracle2.call(encoded);

        require((ok1 == true) && (ok2 == true), "Invalid calls");

        uint256 price1 = abi.decode(price1Bytes, (uint256));
        uint256 price2 = abi.decode(price2Bytes, (uint256));

        if (price1 < price2) {
            return price1;
        }

        return price2;
    }
}

contract PriceOracle1 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}

contract PriceOracle2 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}
