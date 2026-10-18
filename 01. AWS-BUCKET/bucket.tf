# Private Bucket with Tags
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#private-bucket-with-tags
resource "aws_s3_bucket" "private_bucket_example" {
  bucket = "vpb-tfturial-sa-east-1-coisa" #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#bucket-1

  tags = {
    Name = "Private bucket example"
  }
}

# Bucket In Account-Regional Namespace
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#bucket-in-account-regional-namespace

# Get current aws account ID and region
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# Create a bucket in the account-regional namespace
resource "aws_s3_bucket" "account_regional_bucket_example" {
  bucket           = format("vpb-tf-test-bucket-%s-%s-an", data.aws_caller_identity.current.account_id, data.aws_region.current.region)
  bucket_namespace = "account-regional"

  tags = {
    Name = "Account-regional bucket example"
  }
}

# Sequencia execução no cmd

# Verifica Providers, Versão o TF e inicializa o Terraform
# terraform providers
# terraform init
# terraform fmt -> formata o código
# terraform validate -> valida o código

# Plan
# terraform plan -> mostra o que será criado
# terraform plan -out plan.out -> salva o plano de execução no arquivo plan.out (binario)
# terraform show plan.out -> mostra o que será criado a partir do arquivo plan.out

# Apply
# terraform apply -> aplica o plano de execução (planeja novamente antes de executar)
# terraform apply plan.out -> aplica o plano de execução a partir do arquivo plan.out (mais recomendado, pois você validou e registrou)
# terraform apply -auto-approve -> aplica o plano de execução sem pedir confirmação (pipelines)

# Destroy
# terraform destroy -> destrói os recursos criados (alias para 'apply -destroy')
# terraform apply -destroy -> aplica o plano de destruição
# terraform destroy -auto-approve
# terraform plan -out plan.out -destroy -> salva o plano de destruição no arquivo plan.out (binario) | Depois usa terraform apply plan.out