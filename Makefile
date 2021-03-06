# Terraform-related variables
BIN_DIR?=~/bin
TEMP_DIR?=/tmp
# Environment name
ENV?=test

TERRAFORM_VERSION?=0.13.5
TERRAFORM_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
TERRAFORM?=${BIN_DIR}/terraform

# Tflint-related variables
TFLINT_VERSION?=0.20.3
TFLINT_URL=https://github.com/wata727/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip
TFLINT?=${BIN_DIR}/tflint


install_terraform:
	wget ${TERRAFORM_URL} -O ${TEMP_DIR}/terraform-${TERRAFORM_VERSION}.zip
	unzip -o ${TEMP_DIR}/terraform-${TERRAFORM_VERSION}.zip -d ${TEMP_DIR}/
	mv ${TEMP_DIR}/terraform ${BIN_DIR}/terraform-${TERRAFORM_VERSION}
	ln -sf terraform-${TERRAFORM_VERSION} ${BIN_DIR}/terraform
	${BIN_DIR}/terraform --version && rm ${TEMP_DIR}/terraform-${TERRAFORM_VERSION}.zip

install_tflint:
	wget ${TFLINT_URL} -O ${TEMP_DIR}/tflint-${TFLINT_VERSION}.zip
	unzip -o ${TEMP_DIR}/tflint-${TFLINT_VERSION}.zip -d ${TEMP_DIR}/
	mv ${TEMP_DIR}/tflint ${BIN_DIR}/tflint-${TFLINT_VERSION}
	ln -sf tflint-${TFLINT_VERSION} ${BIN_DIR}/tflint
	${BIN_DIR}/tflint --version && rm ${TEMP_DIR}/tflint-${TFLINT_VERSION}.zip


###
# Yandex Cloud
###
yc_create_token:
	yc iam create-token

yc_get_profile:
	yc config profile get ${YC_PROFILE}

yc_list_images:
	yc compute image list --folder-id standard-images

yc_get_user_account:
	yc iam user-account get --login ${YC_USER_ACCOUNT_LOGIN}

###
# Terraform
###
terraform_yc_apply:
	cd ./terraform/yandex-cloud && \
	terraform apply

terraform_yc_destroy:
	cd ./terraform/yandex-cloud && \
	terraform destroy
