# DO NOT CHANGE
aws_profile = "tm-pci-Ops-Techops"
terraformer_bucket = "terraform.pci1.us-east-1.tmaws"

# Your Terraform Variables
# See Naming Standard: https://contegixapp1.livenation.com/confluence/display/AWS/Naming+Standards

aws_region = "us-east-1"
account_tag = "tm-pci"
product_code_tag = "PRD214"
inventory_code_tag = "gatling"
#environment_tag = "preprodpci3"
vpc = "preprodpci"
tier = "app"
availability_zone = "us-east-1a"

## Compute Optimized

##c4.large	2	3.75 GiB	Moderate
#instance_type = "c4.large"
##c4.xlarge	4	7.5 GiB	Moderate
#instance_type = "c4.xlarge"
##c4.2xlarge	8	15 GiB	High
#instance_type = "c4.2xlarge"
##c4.4xlarge	16	30 GiB	High
#instance_type = "c4.4xlarge"
##c4.8xlarge	36	60 GiB	10 Gbps
#instance_type = "c4.8xlarge"

##General Purpose

##m4.large	2	8 GiB
#instance_type = "m4.large"
##m4.xlarge	4	16 GiB
#instance_type = "m4.xlarge"
##m4.2xlarge	8	32 GiB
#instance_type = "2x.large"
##m4.4xlarge	16	64 GiB
#instance_type = "m4.4xlarge"
##m4.10xlarge	40	160 GiB
#instance_type = "m4.10xlarge"
##m4.16xlarge	64	256 GiB
#instance_type = "m4.16xlarge"

product_name = "gatling"
#gatling_version = "2.2.4"
#gatling_scenario_repo = "https://git.tmaws.io/qa/aws-gatling.git"
#simulation_name = "BaseSimulation"
#run_description = "Single Node Container"

## If Gatling Simulations are in a Sub-Folder of Repo i.e. gatling-tests/
#gatling_scenario_location = ""

## simulation repo commit hash
#gatling_scenario_branch = ""

## simulation commit hash
#git_commit = ""

# Pass any scenraio parameters here, e.g. "-Dusers=100 -Dramp=150 -Dduration=300"
#gatling_java_opts = ""

ssh_key = ""

## Experimental, don't change yet
automation_instances = "1"

# Uncomment if you want the instance to just Run Gatling but stay on after gatling completion.
#config = "debug.yaml"