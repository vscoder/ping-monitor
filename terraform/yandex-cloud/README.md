# yandex-cloud infrastructure

Here is described yandex-cloud infrastructure example

## Prepare

First it's need to create [yandex-cloud](https://cloud.yandex.ru/) account.

Then it's need to install `yc` util
```shell
curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash
```

Next create profile folllowing the instruction https://cloud.yandex.ru/docs/cli/quickstart#initialize

Oauth token can be generated with command
```shell
yc iam create-token
```

And set variables values in `./terraform.tfvars` like in `./terraform.tfvars.example`. Variables values can be obtained via the foolowing command:
```shell
yc config list
```

## Up infrastructure

Just run `terraform apply` and type `yes` to up infrastructure

## Destroy infrastructure

To destroy infrastructure, run
```shell
terraform destroy
```
and type `yes`
