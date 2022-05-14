# ldy9037/terraform-backend

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

GCS Bucket으로 Remote Backend 구성 

##### 좋은 commit message 작성을 위한 참고자료

- [commit message 작성 규칙](https://meetup.toast.com/posts/106)
- [commit naming](https://blog.ull.im/engineering/2019/03/10/logs-on-git.html)


## Table of Contents

- [소개](#소개)
- [시작하기](#시작하기)
- [주의사항](#주의사항)
- [참고](#참고)
- [제작자](#제작자)

## 소개

 다른 GCP 기반 모듈들의 Backend를 관리하기 위한 GCP Backend 모듈
 
 ##### 기술 스택
 - terraform v1.1.7
 - [google provider](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs)
 
## 시작하기

Creidentials 설정
```sh
gcloud auth login
gcloud config project set <PROJECT_ID>
```

Terraform 변수 용 환경 변수 지정
```sh
# 실제 bucket 명은 <REGION>-<PREFIX>-<BUCKET_NAME> 형태로 생성됨.
export TF_VAR_region=asia-<REGION>
export TF_VAR_state_bucket_prefix=<PREFIX>
export TF_VAR_state_bucket_name=<BUCKET_NAME>

# backend_prefix는 bucket 내에서 tfstate 파일이 저장 될 위치.
export TF_VAR_backend_bucket=${TF_VAR_state_bucket_prefix}-${TF_VAR_region}-${TF_VAR_state_bucket_name}
export TF_VAR_backend_prefix=<BACKEND_PATH>
```

> main.tf에서 backend block을 제거 후 아래 명령어 실행

Terraform 구성 시작

```sh
terraform init
terraform apply
```

> main.tf에 다시 backend block 추가 후 아래 명령어 실행

Remote Backend 적용
```sh
terraform init \
-backend-config="bucket=$TF_VAR_backend_bucket" \
-backend-config="prefix=$TF_VAR_backend_prefix"
```

## 주의사항
- Backend의 bucket은 현재 생성되어 있는 bucket 명을 지정해 주어야합니다. 
- 따라서 backend block 제거 -> init -> apply해서 bucket 생성 후 다시 backend block을 생성해서 init 해주어야 합니다.

## 참고
- [Terraform GCP Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Terraform Backend Type: GCS](https://www.terraform.io/language/settings/backends/gcs)
- [Terraform State 정리](https://harmonious-lan-9d2.notion.site/Terraform-State-79a2e5707e944055a07b3386da9b6491)

## 제작자
[ldy9037@naver.com]()
