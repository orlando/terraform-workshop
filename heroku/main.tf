/*
 * Variables
 */
variable "heroku" {
  type = "map"
}

provider "heroku" {
  email   = "${var.heroku["email"]}"
  api_key = "${var.heroku["api_key"]}"
}

/*
 * Resources
 */

# Create a Heroku app using a module
module "app" {
  source = "./modules/heroku_app"

  name = "my-super-tf-app"
}

/*
* Outputs
*/

output "web_url" {
  value = "${module.app.web_url}"
}

output "git_url" {
  value = "${module.app.git_url}"
}
