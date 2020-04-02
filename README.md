[![OSO DevOps][logo]](https://osodevops.io)

# aws-terraform-module-ssm-automated-patching
---

This project is part of our open source DevSecOps adoption approach. 

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

This module creates an SSM automated patching process that runs on a schedule.

Requires `aws` provider >= 2.25.0

## Usage

Include this repository as a module in your existing terraform code:
```hcl
module "session-manager" {
  source = "git::ssh://git@github.com/osodevops/aws-terraform-module-ssm-automated-patching.git.git"
  
  application_tag_name         = var.application_tag_name
  ssm_patching_logs_bucket     = var.ssm_patching_logs_bucket
  patching_name                = var.patching_name
  operating_system_filter      = var.operating_system_filter
  environment                  = var.environment
  common_tags                  = var.common_tags
}
```

## Inputs

The following arguments are supported:

* `application_tag_name` = Must exactly matchh the application tag present in OSO DevOps common tags list.

* `environment` = Prefix for all IAM roles, policies and resources created to patching module.

* `operating_system_filter` = Possible values: AMAZON_LINUX AMAZON_LINUX_2 UBUNTU CENTOS REDHAT_ENTERPRISE_LINUX.

* `patching_name` = "System name given to patching task: MUST NOT CONTAIN SPACES.

* `patching_window` = Default value: "cron(0 0 7 ? * SUN *)".

* `patching_duration` = default set to 5.

* `patching_cutoff` = default set to 0.

* `patching_enabled` = set to `true` or `false` to run patching job.

* `schedule_timezone` = TimeZone on whihch the patching schedule should be run, default is set to "Europe/London".

* `ssm_patching_logs_bucket` = "Bucket name of outputted log information from each automation task run.

* `common_tags` = List of common tags to populate in the environment.


## Help

**Got a question?**

File a GitHub [issue](https://github.com/osodevops/aws-terraform-module-ssm-automated-patching/issues), send us an [email][email] or tweet us [twitter][twitter].

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/osodevops/aws-terraform-module-ssm-automated-patching/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or help out with our other projects, we would love to hear from you! Shoot us an [email][email].

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!

## Copyrights

Copyright © 2018-2019 [OSO DevOps](https://osodevops.io)

## License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

[![OSO DevOps][logo]][website]

We are a cloud consultancy specialising in transforming technology organisations through DevOps practices. We help organisations accelerate their capabilities for application delivery and minimize the time-to-market for software-driven innovation. 

Check out [our other projects][github], [follow us on twitter][twitter], or [hire us][hire] to help with your cloud strategy and implementation.

  [logo]: https://osodevops.io/assets/images/logo-purple-b3af53cc.svg
  [website]: https://osodevops.io/
  [github]: https://github.com/orgs/osodevops/
  [hire]: https://osodevops.io/contact/
  [linkedin]: https://www.linkedin.com/company/oso-devops
  [twitter]: https://twitter.com/osodevops
  [email]: https://www.osodevops.io/contact/