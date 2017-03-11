/*
 * Variables
 */
variable "name" {}

variable "region" {
  default = "us"
}

/*
 * Resources
 */

# Create a Heroku app
resource "heroku_app" "default" {
  name   = "${var.name}"
  region = "${var.region}"
}

# Create a database, and configure the app to use it
resource "heroku_addon" "database" {
  app  = "${heroku_app.default.name}"
  plan = "heroku-postgresql:hobby-basic"
}

/*
* Outputs
*/

output "name" {
  value = "${heroku_app.default.name}"
}

output "web_url" {
  value = "${heroku_app.default.web_url}"
}

output "git_url" {
  value = "${heroku_app.default.git_url}"
}
