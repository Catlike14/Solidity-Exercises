// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

/*
Build two ERC20 contracts: RareCoin and SkillsCoin (you can change the name if you like).
Anyone can mint SkillsCoin, but the only way to obtain RareCoin is to send SkillsCoin to the RareCoin contract.
You'll need to remove the restriction that only the owner can mint SkillsCoin.

Here is the workflow:
- mint() SkillsCoin to yourself
- SkillsCoin.approve(address rareCoinAddress, uint256 yourBalanceOfSkillsCoin) RareCoin to take coins from you.
- RareCoin.trade() This will cause RareCoin to SkillsCoin.transferFrom(address you, address RareCoin, uint256 yourBalanceOfSkillsCoin) Remember, RareCoin can known its own address with address(this)
- RareCoin.balanceOf(address you) should return the amount of coin you originally minted for SkillsCoin.

Remember ERC20 tokens(aka contract) can own other ERC20 tokens. So when you call RareCoin.trade(), it should call SkillsCoin.transferFrom and transfer your SkillsCoin to itself, I.e. address(this).
*/

contract SkillsCoin {
    string public name;
    string public symbol;

    mapping(address => uint256) public balanceOf;
    address public owner;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(address => mapping(address => uint256)) public allowance;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        owner = msg.sender;
        decimals = 18;
    }

    function mint(address to, uint256 amount) public {
        totalSupply += amount;
        balanceOf[msg.sender] += amount;
    }

    function _transfer(address from, address to, uint256 amount) private returns (bool) {
        require(balanceOf[from] >= amount, "Not enough money");
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        return true;
    }

    function transfer(address to, uint256 amount) private returns (bool) {
        _transfer(msg.sender, to, amount);
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        allowance[msg.sender][spender] = amount;
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        if (from != msg.sender) {
            require(allowance[from][msg.sender] >= amount, "Not enough allowance");
            allowance[from][msg.sender] -= amount;
        }

        return _transfer(from, to, amount);
    }
}

contract RareCoin {
    string public name;
    string public symbol;

    mapping(address => uint256) public balanceOf;
    address public owner;
    uint8 public decimals;
    uint256 public totalSupply;

    address public skillsCoin;

    mapping(address => mapping(address => uint256)) public allowance;

    constructor(string memory _name, string memory _symbol, address _skillsCoin) {
        name = _name;
        symbol = _symbol;
        owner = msg.sender;
        decimals = 18;
        skillsCoin = _skillsCoin;
    }

    function mint(address to, uint256 amount) public {
        revert("Cannot mint");
    }

    function _transfer(address from, address to, uint256 amount) private returns (bool) {
        require(balanceOf[from] >= amount, "Not enough money");
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        return true;
    }

    function transfer(address to, uint256 amount) private returns (bool) {
        _transfer(msg.sender, to, amount);
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        allowance[msg.sender][spender] = amount;
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        if (from != msg.sender) {
            require(allowance[from][msg.sender] >= amount, "Not enough allowance");
            allowance[from][msg.sender] -= amount;
        }

        return _transfer(from, to, amount);
    }

    function trade(uint256 amount) public {
        bytes memory transferSignature = abi.encodeWithSignature("transferFrom(address,address,uint256)", msg.sender, address(this), amount);
        (bool ok,) = skillsCoin.call(transferSignature);
        require(ok, "call to transferFrom failed");
        balanceOf[msg.sender] += amount;
    }
}