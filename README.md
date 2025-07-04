# gcp-gke-template

Example Backstage template for creating a GKE cluster in GCP using Terraform.

## Usage

This template will create a GKE cluster inside the `spotify-portal-public-demo` GCP project
by using the [Google Terraform provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs).
The Terraform backend is set to a GCS bucket called `spotify-portal-public-demo-terraform`.

When run, the template creates a new GitHub repo where the Terraform configuration files are
added along with GitHub Action workflow files. These workflows are responsible for setting up
and running Terraform and ultimately creating the GKE cluster.

## Permissions

The sections below explain how the permissions work for this Backstage template.
Please note however that this is not a recommended approach to setting up permissions
for Terraform with Backstage and should only serve as an example.

### GCP Service Account

When running the GitHub Action workflow, Terraform needs to have permission to create and
view resources within the GCP project. This is accomplished by creating a
[GCP Service Account](https://cloud.google.com/iam/docs/service-accounts-create) with the
correct permissions and creating/saving a key for that Service Account as a GitHub Secret on
the `spotify-portal-public-demo` org. By using an organisation secret, any new repos created
in that org will automatically be set up with the proper GCP permissions.

### GitHub Integration

When running a template which includes GitHub actions (like this one), the GitHub Backstage
integration, whether using a Personal Access Token or a GitHub App, will require permission
to read and write GitHub Actions. The PAT or GitHub App can be modified if this permission
does not already exist.
