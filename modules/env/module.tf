terraform {
  required_version = ">= 1.6.0"
}

variable "var_name" {
  type = string
  description = "The name of the environment variable that will be fetched"
}

resource "null_resource" "read_with_cli" {
  triggers = { always_run = "${timestamp()}" }
  provisioner "local-exec" {
    # This is a hack because you cannot use ${} next to a $ character
    command = join("", [
      "echo $",
      var.var_name,
      " > ${path.module}/${var.var_name}.var"
    ])
  }
}

data "local_file" "temp_file" {
  depends_on    = [ null_resource.read_with_cli]
  filename      = "${path.module}/${var.var_name}.var" 
}

resource "null_resource" "delete_temp_file" {
  depends_on    = [ data.local_file.temp_file]
  triggers = { always_run = "${timestamp()}" }
  provisioner "local-exec" {
    command = "rm ${path.module}/${var.var_name}.var"
  }
}

output "value" {
  value = chomp(data.local_file.temp_file.content)
  description = "The value of the environment variable"
}