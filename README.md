🧾 **User Profile Smart Contract**

This project is a submission for a Lisk Bootcamp assignment. It includes a Solidity smart contract that enables users to register, update, and retrieve their personal profile information securely on the blockchain.

Project Overview
The UserProfile.sol smart contract provides a decentralized on-chain identity system. It ensures:

Each address can only register once.

Profile data is stored and managed securely.

Registration timestamps are automatically recorded.

**Core Features**
User Registration
Register a profile with name, age, and email.

Profile Updates
Update your profile details at any time.

Profile Retrieval
View your own registered profile information.

Duplicate Prevention
Prevents the same address from registering multiple times.

Timestamping
Records block.timestamp during registration.

🧰 **Technology Stack**
Tool	Description
Solidity	Smart contract programming language
Hardhat	Development environment & testing framework
JavaScript	Used for writing deployment and test scripts

Getting Started
Follow these steps to set up and run the project locally.

Prerequisites
Node.js (Install from nodejs.org)

npm (comes with Node.js)

📥 Installation
Clone the repository:

bash
Copy
Edit
git clone <YOUR_GITHUB_REPO_URL>
Navigate into the project folder:

bash
Copy
Edit
cd <YOUR_PROJECT_FOLDER>
Install dependencies:

bash
Copy
Edit
npm install
🧪 Hardhat Commands
Here are the main commands you'll use during development:

🔨 Compile the Contract
Checks for syntax and builds contract artifacts:

bash
Copy
Edit
npx hardhat compile
🧬 Run Tests
Runs automated tests from the test/ directory:

bash
Copy
Edit
npx hardhat test

🧱 Start a Local Blockchain
Runs a local Ethereum network for development:

bash
Copy
Edit
npx hardhat node

📦 Deploy the Contract
Deploys the UserProfile contract to the local network:

bash
Copy
Edit
npx hardhat run scripts/deploy.js --network localhost

📂 Folder Structure (Optional Add-On)
bash
Copy
Edit
project-root/
├── contracts/
│   └── UserProfile.sol
├── scripts/
│   └── deploy.js
├── test/
│   └── userProfile.test.js
├── hardhat.config.js
└── package.json

🧠 Notes
Make sure your local node is running before deploying.

Only one profile can be registered per wallet address.

Test and deploy using the Hardhat local network before trying on public testnets.
