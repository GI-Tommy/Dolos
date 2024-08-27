# Dolos (BETA) <!-- omit in toc -->

DOLOS (Dolus) was the personified spirit (daimon) of trickery, cunning deception, craftiness, treachery and guile. He was an apprentice of the Titan Prometheus and a companion of the Pseudologoi (Lies). His female counterpart was Apate, the spirit of deception.

Dolos aims to spin up VPS instances accross multiple cloud providers.

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
    - [Required](#required)
    - [Recommended for development](#recommended-for-development)
  - [Project Structure](#project-structure)
    - [Folders](#folders)
    - [Files](#files)
- [Installation](#installation)
  - [Cloud API / User creation](#cloud-api--user-creation)
    - [DigitalOcean](#digitalocean)
    - [OVHCloud](#ovhcloud)
    - [Linode](#linode)
  - [OpenTofu Variables](#opentofu-variables)
- [Running the tests](#running-the-tests)
- [Deployment](#deployment)
- [Built With](#built-with)
- [Contributing](#contributing)
- [Versioning](#versioning)
- [Authors](#authors)
- [License](#license)
- [Acknowledgments](#acknowledgments)


## Getting Started

**WARNING:** The generated SSH keypairs are *NOT* stored securely. The SSH keys are in plain text in the terraform state file and in the output directory (`./files/output/ssh/*`)

These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes. See deployment
for notes on deploying the project on a live system.

### Prerequisites

#### Required

- [OpenTofu](https://opentofu.org/)
  - [Terraform](https://www.terraform.io/) maybe used but is untested and unsupported
- API Tokens / Users for the following cloud serices:
  - [DigitalOcean](https://www.digitalocean.com/)
  - [OVHCloud](https://www.ovh.com/)
  - [Linode](https://www.linode.com/)

#### Recommended for development

- [Visual Studio Code](https://code.visualstudio.com/)
- VS Code Extensions:
  - [OpenTofu](https://marketplace.visualstudio.com/items?itemName=gamunu.opentofu)
  - [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [OpenStack Client](https://docs.openstack.org/python-openstackclient/latest/)

### Project Structure

The overall structure of the projects folders and files are provided below. Included are some notes to aid future development and understanding.

#### Folders
TODO: Add notes

    .
    ├── files
    │   ├── config
    │   │   └── ovhcloud-openstack
    │   └── output
    │       └── ssh
    │           ├── digitalocean
    │           └── ovhcloud
    └── tf
        ├── applications
        │   └── dolos
        └── modules
            ├── digitalocean
            └── ovhcloud


#### Files
TODO: Add notes

    ../tf
    ├── data.tf
    ├── digitalocean.tf
    ├── outputs.tf
    ├── ovhcloud.tf
    ├── providers.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    ├── terraform.tfvars
    ├── terraform.tfvars.example
    └── variables.tf

## Installation

### Cloud API / User creation

#### DigitalOcean

You are required to create a personal access token (or use an existing one). Use the link below for help creating a new token.

https://docs.digitalocean.com/reference/api/create-personal-access-token/


#### OVHCloud

OVHCloud Public Cloud uses OpenStack for the creation and management of instances. Use the link below for help creating an OpenStack user account.

https://help.ovhcloud.com/csm/en-ie-public-cloud-compute-openstack-users?id=kb_article_view&sysparm_article=KB0050623

#### Linode

TODO: Complete this section

### OpenTofu Variables

In the dolos application directory, create a `terraform.tfvars` file using the example file as a starting point:

    cd tf/applications/dolos
    cp terraform.tfvars.example terraform.tfvars

Open the `terraform.tfvars` file and populate the required variables with the API and user account details create earlier.

[For help creating a DigitalOcean API token click here](https://docs.digitalocean.com/reference/api/create-personal-access-token/)

## Running the tests

Explain how to run the automated tests for this system

## Deployment

Add additional notes to deploy this on a live system

## Built With

  - [Contributor Covenant](https://www.contributor-covenant.org/) - Used
    for the Code of Conduct
  - [Creative Commons](https://creativecommons.org/) - Used to choose
    the license

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code
of conduct, and the process for submitting pull requests to us.

## Versioning

We use [Semantic Versioning](http://semver.org/) for versioning. For the versions
available, see the [tags on this
repository](https://github.com/PurpleBooth/a-good-readme-template/tags).

## Authors

  - **Billie Thompson** - *Provided README Template* -
    [PurpleBooth](https://github.com/PurpleBooth)

See also the list of
[contributors](https://github.com/PurpleBooth/a-good-readme-template/contributors)
who participated in this project.

## License

This project is licensed under the [CC0 1.0 Universal](LICENSE.md)
Creative Commons License - see the [LICENSE.md](LICENSE.md) file for
details

## Acknowledgments

  - Hat tip to anyone whose code is used
  - Inspiration
  - etc
