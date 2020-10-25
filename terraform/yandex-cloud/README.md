# yandex-cloud infrastructure

Here is described yandex-cloud infrastructure example

## Prepare

First it's need to create [yandex-cloud](https://cloud.yandex.ru/) account.

Then it's need to install `yc` util
```shell
curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash
```

Next create profile folllowing the instruction https://cloud.yandex.ru/docs/cli/quickstart#initialize

And set variables values in `./terraform.tfvars` like in `./terraform.tfvars.example`. Variables values can be obtained via the foolowing command:
```shell
yc config list
```
