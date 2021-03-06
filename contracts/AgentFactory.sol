pragma solidity ^0.4.24;

import "./Agent.sol";

contract AgentFactory {
    address public token;
    address[] public createdAgents;

    event AgentCreated(address agent);

    constructor(address _token) public {
        token = _token;
    }

    function createAgent(uint price, string endpoint, string metadataURI) public returns (address) {
        address agent = new Agent(token, price, endpoint, metadataURI);
        createdAgents.push(agent);
        emit AgentCreated(agent);
        return agent;
    }
}
