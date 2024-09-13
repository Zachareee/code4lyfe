locals {
  config = {
    golang = {
      runtime = "provided.al2023"
      handler = "bootstrap"
    }
    typescript = {
      runtime = "nodejs20.x"
      handler = "index.handler"
    }
    python = {
      runtime = "python3.12"
      handler = "index.lambda_handler"
    }
  }
}
