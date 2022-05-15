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
  type        = string
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

variable "keyring" {
  description = "keyring 명"
  type        = string
}

variable "key_name" {
  description = "key 이름"
  type        = string
}

variable "key_protection_level" {
  description = "key 보호 수준"
  type        = string
}

variable "key_owners" {
  description = "key 소유자 목록"
  type        = list(string)
}

variable "key_algorithm" {
  description = "key 알고리즘"
  type        = string
}

variable "key_rotation_period" {
  description = "key 순환 주기"
  type        = string
}