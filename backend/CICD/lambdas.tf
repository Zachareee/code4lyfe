module "postregister" {
  source = "./modules/lambdamod"

  function_name = "postregister"
  zip_file = "../output/post-register.zip"
}