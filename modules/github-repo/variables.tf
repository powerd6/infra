variable "name" {
  type        = string
  description = "The name of the repository"
}

variable "description" {
  type        = string
  description = "The description of the repository"
}

variable "topics" {
  type        = set(string)
  description = "The list of topics of the repository"
  default     = []
}

variable "org_administrators" {
  type        = set(string)
  description = "The list of organization administrators that should have special permissions"
  default     = []
}