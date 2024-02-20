# Node.js LTS Version Manager

This package provides a centralized way to manage and synchronize the Node.js Long Term Support (LTS) version across multiple projects. It is designed for development teams looking to ensure consistency in the Node.js runtime environment without the overhead of manual updates and checks. By leveraging this package, projects can automatically align their Node.js versions with the latest LTS release, streamlining setup and reducing compatibility issues.

## Features

- **Centralized Node.js Versioning**: Ensures all projects use the same Node.js LTS version.
- **Easy Integration**: Can be integrated into existing projects with minimal setup.
- **CI/CD Friendly**: Designed to work seamlessly with continuous integration and deployment workflows.

## Getting Started

### Installation

To add this package to your project, run:

```bash
npm install @al-mabsut/nodejs-lts-version --save-dev
```

### Usage

This package is intended to be used in conjunction with tools like `.tool-versions` or Docker images to specify the Node.js version in use. It does not directly affect your project's runtime environment but acts as a reference for the Node.js LTS version.

1. **Referencing in Build Scripts**: You can reference the LTS version in your build scripts or CI/CD pipeline configuration to ensure the correct Node.js version is being used. See the "Integration" section for examples.

2. **Updating `.tool-versions`**: Include a step in your CI/CD pipeline to read the version from this package's `package.json` and update the `.tool-versions` file accordingly.

In total, there are two different NodeJS LTS versions that are being tracked inside our package.json file:

1. LTS version as it appears at: https://nodejs.org
2. LTS version as is reflected by `docker pull node:lts`

Generally, there can be a delay of a few days between the official LTS release vs when the same is available in Docker.

By using this package, it should be easier for you to automate updating your tool-versions across your different projects.

### Integration

Example of updating `.tool-versions` in a script:

```bash
NODE_VERSION=$(jq -r '.lts["nodejs.org"]' ./node_modules/nodejs-lts-version-manager/package.json)

npx node-lts $NODE_VERSION
```

Ensure you have `jq` installed in your environment for the above command to work.

## Contributing

We welcome contributions from the community! Whether you're reporting a bug, submitting a feature request, or contributing code, we value your input and contributions.

- **Reporting Issues**: Use the GitHub Issues section to report bugs or suggest features.
- **Submitting Pull Requests**: If you're looking to contribute directly, please fork the repository, make your changes, and submit a pull request.

## License

This project is open-sourced under the MIT License. See the LICENSE file for more details.

## Acknowledgments

- Thank you to all the contributors who spend their time helping to improve this project.
- Special thanks to the Node.js community for continuously fostering an environment of growth and innovation.
