variable "app_prefix" {
  type        = string
  description = "Required - App Prefix"
}

variable "cidr_block" {
  default     = "10.0.0.0/16"
  type        = string
  description = "Cidr block value (optional). Defaults to 10.0.0.0/16"
}

variable "subnet_count" {
  default     = 2
  type        = number
  description = "Defaults to 2"

  validation {
    condition     = var.subnet_count >= 0 && var.subnet_count <= 200
    error_message = "Subnet count must be between 1 and 200"
  }
}

variable "existing_vpc_id" {
  type        = string
  default     = ""
  description = "If you want to provide your own vpc in the mix, provide ID here, otherwise module will create one for you"
}