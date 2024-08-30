locals {
  is_linux = length(regexall("/home/", lower(abspath(path.root)))) > 0
}

resource "terraform_data" "name" {
  provisioner "local-exec" {
    command = is_linux ? "../build.sh" : "../build.bat"
  }
}
