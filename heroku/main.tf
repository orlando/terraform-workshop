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

# Create a Heroku app
resource "heroku_app" "default" {
  name   = "my-super-tf-app"
  region = "us"
}

# Create a database, and configure the app to use it
resource "heroku_addon" "database" {
  app  = "${heroku_app.default.name}"
  plan = "heroku-postgresql:hobby-basic"
}

/*
* Outputs
*/

output "web_url" {
  value = "${heroku_app.default.web_url}"
}

output "git_url" {
  value = "${heroku_app.default.git_url}"
}
