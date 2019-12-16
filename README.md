#AWS infra

Задание:
1) Зарегистрироваться в Amazon
2) Создать свой VPC, публичный subnet
3) Создать ASG минимального размера, произвольной линухи на вкус
4) Создать AWS ALB, связать c новоиспеченным ASG
5) Завести внутренню зону *my-nginx.internal*  через Route53
6) на ASG тачке(ах) должен происходить следующий бутстрап:
        - Устанавливаться Docker Engine
        - С ремоутного репозитория качаться "docker-compose" файл, где будет собираться/ранаться следующее:
              стандартный nginx, который выводит текст "Hello, i am Nginx on instance: ${instance_id}"

Дополнение на *:
7*) Создать AWS ECR, загрузить образ nginx туда и уже оттуда забирать стандартный образ вместо публичной репы
8*) *my-nginx.internal* должен быть доступен по https, добавить самоподписанный SSL сертификат

Ограничения:
    -    Тулы\Cloud, которым нужно научиться\проверить знания: git, terraform, ansible, aws
    -    Мелкие баш-скрипты разрешены
    -       Можно использовать другие тулы, но с крепким обоснованием почему тулы выше не подходят
    -    Код должен храниться в публичном доступе, например, на гитхабе
    -    Обязательное README.md, чтобы не гадать о последовательности  подготовительных действий

Ожидаемые действия:
1. Чтение README.md, пред-подготовка
2. Запуск terraform
3. Смотреть в браузер как отрабатывает ALB, получая сообщеньку от nginx(ов) по адресу my-nginx.internal

## Prerequisites

AWS CLIv2
sudo ./aws/install
```
curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

## Getting credentials

1. created user at https://console.aws.amazon.com/iam/home#/users
2. placed credentials to ~/.aws/credentials

## T1
account: atikhonov.aws
user: guildin

## T2
В modules/vp/main.tf описаны:
- vpc_net10 with CIDR: 10.0.0.0/16
- aws_subnets: net10_1(a|b|c), mapped to availability_zone(s) eu-central-1(a|b|c)


## T3
Создан ASG, назначен на vpc_net10

## T4
alb описан, а вот связка его с группой машин вдруг оказалась делом нетривиальным
## T5

## T6
Постановка задачи:
Слизать динамический инвентори для AWS https://docs.ansible.com/ansible/latest/user_guide/intro_dynamic_inventory.html#inventory-script-example-aws-ec2 
Накопать плейбук для установки докера на ASG экземпляры (сука, тогда же ручками придется их скейлить, есичовдруг).
Запилить Т7.
  * лучше выпечь пакером нужный мне образ и назначить его на развертывание ASG. Хотя про то, как AWS делает автоскейлинг я еще не знаю (((

## T7
ECR URI: 289341358241.dkr.ecr.eu-central-1.amazonaws.com/atikhonov
