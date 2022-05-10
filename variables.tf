variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "state_bucket_name" {
  description = "state 저장 용 버킷의 이름"
  type        = list(string)
}

variable "state_bucket_prefix" {
  description = "bucket 접두사"
  type        = string
}

variable "state_bucket_storage_class" {
  description = "state 저장 용 버킷의 Storage Class"
  type        = string
}

variable "state_bucket_versioning" {
  description = "state 저장 용 버킷의 파일 Versioning 여부"
  type        = bool
}