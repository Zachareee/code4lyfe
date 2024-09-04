resource "null_resource" "build_script" {
  provisioner "local-exec" {
    command     = length(regexall("/home/", lower(abspath(path.root)))) > 0 ? "build.sh" : "build.bat"
    working_dir = ".."
  }

  triggers = {
    filechange = sha1(join("", [for f in fileset("../src", "**"): filesha1("../src/${f}")]))
  }
}