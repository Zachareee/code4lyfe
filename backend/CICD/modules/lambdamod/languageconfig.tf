locals {
  config = {
    golang = {
      runtime = "provided.al2023"
      handler = "bootstrap"
    }

    javascript = {
      runtime = "nodejs20.x"
      handler = "index.handler"
    }
  }
}
