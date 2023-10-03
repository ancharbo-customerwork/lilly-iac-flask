# lilly-iac-flask

This project is a simple proof-of-concept that outlines how both IaC deployments can be orchestrated side-by-side with application code deployments via GitHub Actions.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Project Directory Structure

- [`/.github`](./.github) - GitHub Actions workflows and Markdown Templates for Pull Requests/Issues
- [`/terraform`](./terraform) - Terraform code for deploying the infrastructure. See the [README](./terraform/README.md) for more information.
- [`/src`](./src) - Source code for the Flask application. See the [README](./src/README.md) for more information.
