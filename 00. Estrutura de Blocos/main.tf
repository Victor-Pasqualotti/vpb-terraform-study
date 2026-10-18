# No CMD: terraform -help
# Main commands:
#   init          Prepare your working directory for other commands
#   validate      Check whether the configuration is valid
#   plan          Show changes required by the current configuration
#   apply         Create or update infrastructure
#   destroy       Destroy previously-created infrastructure

# All other commands:
#   console       Try Terraform expressions at an interactive command prompt
#   fmt           Reformat your configuration in the standard style
#   force-unlock  Release a stuck lock on the current workspace
#   get           Install or upgrade remote Terraform modules
#   graph         Generate a Graphviz graph of the steps in an operation
#   import        Associate existing infrastructure with a Terraform resource
#   login         Obtain and save credentials for a remote host
#   logout        Remove locally-stored credentials for a remote host
#   metadata      Metadata related commands
#   modules       Show all declared modules in a working directory
#   output        Show output values from your root module
#   providers     Show the providers required for this configuration
#   query         Search and list remote infrastructure with Terraform
#   refresh       Update the state to match remote systems
#   show          Show the current state or a saved plan
#   stacks        Manage HCP Terraform stack operations
#   state         Advanced state management
#   taint         Mark a resource instance as not fully functional
#   test          Execute integration tests for Terraform modules
#   untaint       Remove the 'tainted' state from a resource instance
#   version       Show the current Terraform version
#   workspace     Workspace management

# Global options (use these before the subcommand, if any):
#   -chdir=DIR    Switch to a different working directory before executing the
#                 given subcommand.
#   -help         Show this help output or the help for a specified subcommand.
#   -version      An alias for the "version" subcommand.

terraform {
    # Geralmente fica no arquivo main.tf, mas pode ficar em qualquer arquivo .tf
    required_version = "~> 1.16.0" # Versão do terraform.

    # Provedor: AWS
    required_providers {
        aws = {
            version = "~> 6.69.0"       # Tudo que for maior que 6.69.0 até 6.69.n
            source  = "hashicorp/aws"   # provider oficial
        }
    }

    # Onde ele vai armazenar o estado do Terraform, que é um arquivo que guarda o estado da infraestrutura criada pelo Terraform.
    backend "s3" {
        bucket = "nome-do-bucket"
        key    = "caminho/para/o/arquivo/terraform.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {

}

resource "aws_s3_bucket" "name" {

}

data "aws_instance" "name" {
    # Busca informação fora do código Terraform
    # Como recursos já existentes na AWS

    # Pode ter o mesmo "name" de "resource"
}

module "name" {
    # Reutilização de código
    # Pode pegar da internet ou da propria máquina local
}

variable  "name" {
    # Variáveis de entrada
}

output "name" {
    # Variáveis de saída
}

locals {
    # Variaveis locais, pode armazenar expressões. Evita repetições.
}

import {
    # Importa recursos já existentes na AWS para o Terraform gerenciar
    # Criei o recurso manualmente e agora quero que o Terraform gerencie ele
}

moved {
    # Move recursos entre módulos ou entre blocos: muda a referência interna do recurso (name) e ou (caminho)
}

removed {
    # Remove recursos do Terraform, mas não da AWS. O recurso continua existindo na AWS, mas o Terraform não vai mais gerenciar ele.
}

check "name" {
    # Faz verificação na infraestrutura, como por exemplo se o recurso existe ou não. 
    # Pode ser usado para validar se o recurso foi criado corretamente.

    # Recurso pode ter sido criado manualmente ou pelo Terraform, mas o check vai validar se ele existe e se está correto.
    # Ex: verifica se máquina virtual está ligada.
}

