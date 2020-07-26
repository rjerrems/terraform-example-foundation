/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "restricted_shared_vpc_project" {
  source                      = "../../modules/single_project"
  impersonate_service_account = var.terraform_service_account
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = var.parent_folder
  skip_gcloud_download        = var.skip_gcloud_download
  environment                 = "nonprod"
  env_code                    = "n"
  vpc_type                    = "restricted"

  activate_apis                      = ["accesscontextmanager.googleapis.com"]
  vpc_service_control_attach_enabled = "true"
  vpc_service_control_perimeter_name = "accessPolicies/${var.policy_id}/servicePerimeters/${var.perimeter_name}"

  # Metadata
  project_prefix    = "bu2-n-sample"
  application_name  = "bu2-sample-application2"
  billing_code      = "1234"
  primary_contact   = "example@example.com"
  secondary_contact = "example2@example.com"
  business_code     = "bu2"
}

#   # Network Setting (Optional)
#   enable_networking    = true
#   subnet_ip_cidr_range = "10.3.0.0/16"
#   subnet_secondary_ranges = [{
#     range_name    = "gke-pod",
#     ip_cidr_range = "10.4.0.0/16"
#     }, {
#     range_name    = "gke-svc",
#     ip_cidr_range = "10.5.0.0/16"
#   }]

#   # DNS Setting (Optional)
#   enable_private_dns = true
#   domain             = var.domain
# }