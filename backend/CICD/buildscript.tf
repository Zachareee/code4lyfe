resource "null_resource" "build_script" {
  for_each = toset(var.foldernames)

  provisioner "local-exec" {
    command     = length(regexall("/home/", lower(abspath(path.root)))) > 0 ? "build.sh" : "build.bat"
    working_dir = "../src/${each.key}/"
  }

  triggers = {
    filechange = sha1(join("", [
      for f in fileset("../src/${each.key}", "**") : filesha1("../src/${each.key}/${f}")
    ]))
  }
}