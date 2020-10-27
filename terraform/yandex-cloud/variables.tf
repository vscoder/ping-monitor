variable oauth_token {
  description = "Oauth token"
}
variable cloud_id {
  description = "Cloud ID"
}
variable folder_id {
  description = "Folder ID"
}
variable zone {
  description = "Zone"
  default = "ru-central1-a"
}

variable public_key_path {
  description = "SSH public key path"
  default = "~/.ssh/id_rsa.pub"
}
