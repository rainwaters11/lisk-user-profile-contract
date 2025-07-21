// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title UserProfile
 * @dev A smart contract that allows users to register and manage their profile information.
 */
contract UserProfile {

    // --- State Variables ---

    /**
     * @dev A struct to hold all the information for a single user profile.
     */
    struct User {
        bool isRegistered;
        string name;
        uint age;
        string email;
        uint registrationTimestamp;
    }

    /**
     * @dev A mapping from a user's address to their User struct.
     * This is the primary data storage for the contract.
     * The mapping is public, which automatically creates a getter function.
     * For a user's address `addr`, you can access their profile via `profiles(addr)`.
     */
    mapping(address => User) public profiles;


    // --- Events ---

    /**
     * @dev Emitted when a new user registers a profile.
     * @param userAddress The address of the newly registered user.
     * @param name The name of the user.
     */
    event UserRegistered(address indexed userAddress, string name);

    /**
     * @dev Emitted when a user updates their profile.
     * @param userAddress The address of the user who updated their profile.
     */
    event ProfileUpdated(address indexed userAddress);


    // --- Functions ---

    /**
     * @notice Registers a new user profile for the caller.
     * @dev The function will revert if the user (`msg.sender`) is already registered.
     * @param _name The name of the user.
     * @param _age The age of the user.
     * @param _email The email address of the user.
     */
    function register(string memory _name, uint _age, string memory _email) public {
        // Validate that the user cannot register twice.
        require(!profiles[msg.sender].isRegistered, "Error: User is already registered.");

        // Store the user's information in the 'profiles' mapping.
        profiles[msg.sender] = User({
            isRegistered: true,
            name: _name,
            age: _age,
            email: _email,
            registrationTimestamp: block.timestamp
        });

        // Emit an event to log the registration on the blockchain.
        emit UserRegistered(msg.sender, _name);
    }

    /**
     * @notice Allows a registered user to update their profile information.
     * @dev The function will revert if the user (`msg.sender`) is not yet registered.
     * @param _name The new name for the user.
     * @param _age The new age for the user.
     * @param _email The new email for the user.
     */
    function updateProfile(string memory _name, uint _age, string memory _email) public {
        // Validate that the user is already registered.
        require(profiles[msg.sender].isRegistered, "Error: User is not registered. Please register first.");

        // Retrieve the user's profile from storage.
        User storage user = profiles[msg.sender];

        // Update the profile with the new information.
        user.name = _name;
        user.age = _age;
        user.email = _email;

        // Emit an event to log the profile update.
        emit ProfileUpdated(msg.sender);
    }

    /**
     * @notice Fetches the profile information for the calling user (`msg.sender`).
     * @dev This is a view function, so it does not cost any gas to call.
     * It will revert if the caller is not a registered user.
     * @return name The user's name.
     * @return age The user's age.
     * @return email The user's email.
     * @return registrationTimestamp The Unix timestamp of the user's registration.
     */
    function getProfile() public view returns (string memory name, uint age, string memory email, uint registrationTimestamp) {
        // Validate that the user is registered before fetching their info.
        require(profiles[msg.sender].isRegistered, "Error: User is not registered.");

        // Retrieve the user's profile from storage.
        User storage user = profiles[msg.sender];

        // Return the user's profile details.
        return (user.name, user.age, user.email, user.registrationTimestamp);
    }
}
