#!/usr/bin/env node

const { execSync } = require('child_process');
const path = require('path');

// Retrieve the Node.js version argument from the command line
const nodeVersion = process.argv[3];

if (!nodeVersion) {
  console.error('Error: You must provide a Node.js version as an argument.');
  process.exit(1);
}

// Path to your shell script within the package
const scriptPath = path.join(__dirname, 'update-tool-versions.sh');

try {
  // Execute the shell script with the Node.js version as an argument
  const output = execSync(`bash "${scriptPath}" "${nodeVersion}"`).toString();
  console.log(output);
} catch (error) {
  console.error(`Error executing update-tool-versions.sh: ${error}`);
  process.exit(1);
}
