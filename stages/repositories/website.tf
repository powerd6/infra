module "website" {
  source             = "../../modules/github-repo"
  name               = "website"
  description        = "The landing page for the powerd6 project."
  topics             = ["website"]
  org_administrators = var.org_administrators
  # TODO: add github pages
}