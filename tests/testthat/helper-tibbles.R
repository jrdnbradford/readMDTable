test_tibble_1 <- tibble::tribble(
  ~Name,   ~Age, ~City,         ~Date,
  "Alice", 30,   "New York",    lubridate::ymd("2021/01/08"),
  "Bob",   25,   "Los Angeles", lubridate::ymd("2023/07/22"),
  "Carol", 27,   "Chicago",     lubridate::ymd("2022/11/01")
)

test_tibble_2 <- tibble::tribble(
  ~Name,   ~Age, ~City,         ~Date,
  "Alice", 30,   NA,            lubridate::ymd("2021/01/08"),
  "Bob",   25,   "Los Angeles", lubridate::ymd("2023/07/22"),
  "Carol", 27,   "Chicago",     NA
)

# Terraform tibbles created with dput
tf_tibble_1 <- structure(
  list(
    Name = c(
      "add\\_cluster\\_firewall\\_rules", "add\\_master\\_webhook\\_firewall\\_rules",
      "add\\_shadow\\_firewall\\_rules", "additional\\_ip\\_range\\_pods",
      "additive\\_vpc\\_scope\\_dns\\_domain", "authenticator\\_security\\_group",
      "boot\\_disk\\_kms\\_key", "cluster\\_autoscaling", "cluster\\_dns\\_domain",
      "cluster\\_dns\\_provider", "cluster\\_dns\\_scope", "cluster\\_ipv4\\_cidr",
      "cluster\\_resource\\_labels", "config\\_connector", "configure\\_ip\\_masq",
      "create\\_service\\_account", "database\\_encryption", "datapath\\_provider",
      "default\\_max\\_pods\\_per\\_node", "deletion\\_protection",
      "description", "disable\\_default\\_snat", "disable\\_legacy\\_metadata\\_endpoints",
      "dns\\_cache", "enable\\_binary\\_authorization", "enable\\_cilium\\_clusterwide\\_network\\_policy",
      "enable\\_confidential\\_nodes", "enable\\_cost\\_allocation",
      "enable\\_default\\_node\\_pools\\_metadata", "enable\\_gcfs",
      "enable\\_identity\\_service", "enable\\_intranode\\_visibility",
      "enable\\_kubernetes\\_alpha", "enable\\_l4\\_ilb\\_subsetting",
      "enable\\_mesh\\_certificates", "enable\\_network\\_egress\\_export",
      "enable\\_resource\\_consumption\\_export", "enable\\_secret\\_manager\\_addon",
      "enable\\_shielded\\_nodes", "enable\\_tpu", "enable\\_vertical\\_pod\\_autoscaling",
      "filestore\\_csi\\_driver", "firewall\\_inbound\\_ports", "firewall\\_priority",
      "fleet\\_project", "gateway\\_api\\_channel", "gce\\_pd\\_csi\\_driver",
      "gcp\\_public\\_cidrs\\_access\\_enabled", "gcs\\_fuse\\_csi\\_driver",
      "gke\\_backup\\_agent\\_config", "grant\\_registry\\_access",
      "horizontal\\_pod\\_autoscaling", "http\\_load\\_balancing",
      "identity\\_namespace", "initial\\_node\\_count", "insecure\\_kubelet\\_readonly\\_port\\_enabled",
      "ip\\_masq\\_link\\_local", "ip\\_masq\\_resync\\_interval",
      "ip\\_range\\_pods", "ip\\_range\\_services", "issue\\_client\\_certificate",
      "kubernetes\\_version", "logging\\_enabled\\_components", "logging\\_service",
      "maintenance\\_end\\_time", "maintenance\\_exclusions", "maintenance\\_recurrence",
      "maintenance\\_start\\_time", "master\\_authorized\\_networks",
      "monitoring\\_enable\\_managed\\_prometheus", "monitoring\\_enable\\_observability\\_metrics",
      "monitoring\\_enable\\_observability\\_relay", "monitoring\\_enabled\\_components",
      "monitoring\\_service", "name", "network", "network\\_policy",
      "network\\_policy\\_provider", "network\\_project\\_id", "network\\_tags",
      "node\\_metadata", "node\\_pools", "node\\_pools\\_cgroup\\_mode",
      "node\\_pools\\_labels", "node\\_pools\\_linux\\_node\\_configs\\_sysctls",
      "node\\_pools\\_metadata", "node\\_pools\\_oauth\\_scopes", "node\\_pools\\_resource\\_labels",
      "node\\_pools\\_resource\\_manager\\_tags", "node\\_pools\\_tags",
      "node\\_pools\\_taints", "non\\_masquerade\\_cidrs", "notification\\_config\\_topic",
      "notification\\_filter\\_event\\_type", "project\\_id", "ray\\_operator\\_config",
      "region", "regional", "registry\\_project\\_ids", "release\\_channel",
      "remove\\_default\\_node\\_pool", "resource\\_usage\\_export\\_dataset\\_id",
      "security\\_posture\\_mode", "security\\_posture\\_vulnerability\\_mode",
      "service\\_account", "service\\_account\\_name", "service\\_external\\_ips",
      "shadow\\_firewall\\_rules\\_log\\_config", "shadow\\_firewall\\_rules\\_priority",
      "stack\\_type", "stateful\\_ha", "stub\\_domains", "subnetwork",
      "timeouts", "upstream\\_nameservers", "windows\\_node\\_pools",
      "zones"
    ),
    Description = c(
      "Create additional firewall rules",
      "Create master\\_webhook firewall rules for ports defined in `firewall_inbound_ports`",
      "Create GKE shadow firewall (the same as default firewall rules with firewall logs enabled).",
      "List of _names_ of the additional secondary subnet ip ranges to use for pods",
      "This will enable Cloud DNS additive VPC scope. Must provide a domain name that is unique within the VPC. For this to work cluster\\_dns = `CLOUD_DNS` and cluster\\_dns\\_scope = `CLUSTER_SCOPE` must both be set as well.",
      "The name of the RBAC security group for use with Google security groups in Kubernetes RBAC. Group name must be in format gke-security-groups@yourdomain.com",
      "The Customer Managed Encryption Key used to encrypt the boot disk attached to each node in the node pool, if not overridden in `node_pools`. This should be of the form projects/[KEY\\_PROJECT\\_ID]/locations/[LOCATION]/keyRings/[RING\\_NAME]/cryptoKeys/[KEY\\_NAME]. For more information about protecting resources with Cloud KMS Keys please see: https://cloud.google.com/compute/docs/disks/customer-managed-encryption",
      "Cluster autoscaling configuration. See [more details](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters#clusterautoscaling)",
      "The suffix used for all cluster service records.", "Which in-cluster DNS provider should be used. PROVIDER\\_UNSPECIFIED (default) or PLATFORM\\_DEFAULT or CLOUD\\_DNS.",
      "The scope of access to cluster DNS records. DNS\\_SCOPE\\_UNSPECIFIED (default) or CLUSTER\\_SCOPE or VPC\\_SCOPE.",
      "The IP address range of the kubernetes pods in this cluster. Default is an automatically assigned CIDR.",
      "The GCE resource labels (a map of key/value pairs) to be applied to the cluster",
      "Whether ConfigConnector is enabled for this cluster.", "Enables the installation of ip masquerading, which is usually no longer required when using aliasied IP addresses. IP masquerading uses a kubectl call, so when you have a private cluster, you will need access to the API server.",
      "Defines if service account specified to run nodes should be created.",
      "Application-layer Secrets Encryption settings. The object format is {state = string, key\\_name = string}. Valid values of state are: \"ENCRYPTED\"; \"DECRYPTED\". key\\_name is the name of a CloudKMS key.",
      "The desired datapath provider for this cluster. By default, `DATAPATH_PROVIDER_UNSPECIFIED` enables the IPTables-based kube-proxy implementation. `ADVANCED_DATAPATH` enables Dataplane-V2 feature.",
      "The maximum number of pods to schedule per node", "Whether or not to allow Terraform to destroy the cluster.",
      "The description of the cluster", "Whether to disable the default SNAT to support the private use of public IP addresses",
      "Disable the /0.1/ and /v1beta1/ metadata server endpoints on the node. Changing this value will cause all node pools to be recreated.",
      "The status of the NodeLocal DNSCache addon.", "Enable BinAuthZ Admission controller",
      "Enable Cilium Cluster Wide Network Policies on the cluster",
      "An optional flag to enable confidential node config.", "Enables Cost Allocation Feature and the cluster name and namespace of your GKE workloads appear in the labels field of the billing export to BigQuery",
      "Whether to enable the default node pools metadata key-value pairs such as `cluster_name` and `node_pool`",
      "Enable image streaming on cluster level.", "(Optional) Enable the Identity Service component, which allows customers to use external identity providers with the K8S API.",
      "Whether Intra-node visibility is enabled for this cluster. This makes same node pod to pod traffic visible for VPC network",
      "Whether to enable Kubernetes Alpha features for this cluster. Note that when this option is enabled, the cluster cannot be upgraded and will be automatically deleted after 30 days.",
      "Enable L4 ILB Subsetting on the cluster", "Controls the issuance of workload mTLS certificates. When enabled the GKE Workload Identity Certificates controller and node agent will be deployed in the cluster. Requires Workload Identity.",
      "Whether to enable network egress metering for this cluster. If enabled, a daemonset will be created in the cluster to meter network egress traffic.",
      "Whether to enable resource consumption metering on this cluster. When enabled, a table will be created in the resource export BigQuery dataset to store resource consumption data. The resulting table can be joined with the resource usage table or with BigQuery billing export.",
      "Enable the Secret Manager add-on for this cluster", "Enable Shielded Nodes features on all nodes in this cluster",
      "Enable Cloud TPU resources in the cluster. WARNING: changing this after cluster creation is destructive!",
      "Vertical Pod Autoscaling automatically adjusts the resources of pods controlled by it",
      "The status of the Filestore CSI driver addon, which allows the usage of filestore instance as volumes",
      "List of TCP ports for admission/webhook controllers. Either flag `add_master_webhook_firewall_rules` or `add_cluster_firewall_rules` (also adds egress rules) must be set to `true` for inbound-ports firewall rules to be applied.",
      "Priority rule for firewall rules", "(Optional) Register the cluster with the fleet in this project.",
      "The gateway api channel of this cluster. Accepted values are `CHANNEL_STANDARD` and `CHANNEL_DISABLED`.",
      "Whether this cluster should enable the Google Compute Engine Persistent Disk Container Storage Interface (CSI) Driver.",
      "Allow access through Google Cloud public IP addresses", "Whether GCE FUSE CSI driver is enabled for this cluster.",
      "Whether Backup for GKE agent is enabled for this cluster.",
      "Grants created cluster-specific service account storage.objectViewer and artifactregistry.reader roles.",
      "Enable horizontal pod autoscaling addon", "Enable httpload balancer addon",
      "The workload pool to attach all Kubernetes service accounts to. (Default value of `enabled` automatically sets project-based pool `[project_id].svc.id.goog`)",
      "The number of nodes to create in this cluster's default node pool.",
      "Whether or not to set `insecure_kubelet_readonly_port_enabled` for node pool defaults and autopilot clusters. Note: this can be set at the node pool level separately within `node_pools`.",
      "Whether to masquerade traffic to the link-local prefix (169.254.0.0/16).",
      "The interval at which the agent attempts to sync its ConfigMap file from the disk.",
      "The _name_ of the secondary subnet ip range to use for pods",
      "The _name_ of the secondary subnet range to use for services",
      "Issues a client certificate to authenticate to the cluster endpoint. To maximize the security of your cluster, leave this option disabled. Client certificates don't automatically rotate and aren't easily revocable. WARNING: changing this after cluster creation is destructive!",
      "The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region.",
      "List of services to monitor: SYSTEM\\_COMPONENTS, APISERVER, CONTROLLER\\_MANAGER, KCP\\_CONNECTION, KCP\\_SSHD, SCHEDULER, and WORKLOADS. Empty list is default GKE configuration.",
      "The logging service that the cluster should write logs to. Available options include logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none",
      "Time window specified for recurring maintenance operations in RFC3339 format",
      "List of maintenance exclusions. A cluster can have up to three",
      "Frequency of the recurring maintenance window in RFC5545 format.",
      "Time window specified for daily or recurring maintenance operations in RFC3339 format",
      "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists).",
      "Configuration for Managed Service for Prometheus. Whether or not the managed collection is enabled.",
      "Whether or not the advanced datapath metrics are enabled.",
      "Whether or not the advanced datapath relay is enabled.", "List of services to monitor: SYSTEM\\_COMPONENTS, APISERVER, SCHEDULER, CONTROLLER\\_MANAGER, STORAGE, HPA, POD, DAEMONSET, DEPLOYMENT, STATEFULSET, KUBELET, CADVISOR and DCGM. In beta provider, WORKLOADS is supported on top of those 12 values. (WORKLOADS is deprecated and removed in GKE 1.24.) KUBELET and CADVISOR are only supported in GKE 1.29.3-gke.1093000 and above. Empty list is default GKE configuration.",
      "The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none",
      "The name of the cluster (required)", "The VPC network to host the cluster in (required)",
      "Enable network policy addon", "The network policy provider.",
      "The project ID of the shared VPC's host (for shared vpc support)",
      "(Optional) - List of network tags applied to auto-provisioned node pools.",
      "Specifies how node metadata is exposed to the workload running on the node",
      "List of maps containing node pools", "Map of strings containing cgroup node config by node-pool name",
      "Map of maps containing node labels by node-pool name", "Map of maps containing linux node config sysctls by node-pool name",
      "Map of maps containing node metadata by node-pool name", "Map of lists containing node oauth scopes by node-pool name",
      "Map of maps containing resource labels by node-pool name", "Map of maps containing resource manager tags by node-pool name",
      "Map of lists containing node network tags by node-pool name",
      "Map of lists containing node taints by node-pool name", "List of strings in CIDR notation that specify the IP address ranges that do not use IP masquerading.",
      "The desired Pub/Sub topic to which notifications will be sent by GKE. Format is projects/{project}/topics/{topic}.",
      "Choose what type of notifications you want to receive. If no filters are applied, you'll receive all notification types. Can be used to filter what notifications are sent. Accepted values are UPGRADE\\_AVAILABLE\\_EVENT, UPGRADE\\_EVENT, and SECURITY\\_BULLETIN\\_EVENT.",
      "The project ID to host the cluster in (required)", "The Ray Operator Addon configuration for this cluster.",
      "The region to host the cluster in (optional if zonal cluster / required if regional)",
      "Whether is a regional cluster (zonal cluster if set false. WARNING: changing this after cluster creation is destructive!)",
      "Projects holding Google Container Registries. If empty, we use the cluster project. If a service account is created and the `grant_registry_access` variable is set to `true`, the `storage.objectViewer` and `artifactregsitry.reader` roles are assigned on these projects.",
      "The release channel of this cluster. Accepted values are `UNSPECIFIED`, `RAPID`, `REGULAR` and `STABLE`. Defaults to `REGULAR`.",
      "Remove default node pool while setting up the cluster", "The ID of a BigQuery Dataset for using BigQuery as the destination of resource usage export.",
      "Security posture mode. Accepted values are `DISABLED` and `BASIC`. Defaults to `DISABLED`.",
      "Security posture vulnerability mode. Accepted values are `VULNERABILITY_DISABLED`, `VULNERABILITY_BASIC`, and `VULNERABILITY_ENTERPRISE`. Defaults to `VULNERABILITY_DISABLED`.",
      "The service account to run nodes as if not overridden in `node_pools`. The create\\_service\\_account variable default value (true) will cause a cluster-specific service account to be created. This service account should already exists and it will be used by the node pools. If you wish to only override the service account name, you can use service\\_account\\_name variable.",
      "The name of the service account that will be created if create\\_service\\_account is true. If you wish to use an existing service account, use service\\_account variable.",
      "Whether external ips specified by a service will be allowed in this cluster",
      "The log\\_config for shadow firewall rules. You can set this variable to `null` to disable logging.",
      "The firewall priority of GKE shadow firewall rules. The priority should be less than default firewall, which is 1000.",
      "The stack type to use for this cluster. Either `IPV4` or `IPV4_IPV6`. Defaults to `IPV4`.",
      "Whether the Stateful HA Addon is enabled for this cluster.",
      "Map of stub domains and their resolvers to forward DNS queries for a certain domain to an external DNS server",
      "The subnetwork to host the cluster in (required)", "Timeout for cluster operations.",
      "If specified, the values replace the nameservers taken by default from the node’s /etc/resolv.conf",
      "List of maps containing Windows node pools", "The zones to host the cluster in (optional if regional cluster / required if zonal)"
    ),
    Type = c(
      "`bool`", "`bool`", "`bool`", "`list(string)`", "`string`",
      "`string`", "`string`", "<pre>object({<br>    enabled                     = bool<br>    autoscaling_profile         = string<br>    min_cpu_cores               = number<br>    max_cpu_cores               = number<br>    min_memory_gb               = number<br>    max_memory_gb               = number<br>    gpu_resources               = list(object({ resource_type = string, minimum = number, maximum = number }))<br>    auto_repair                 = bool<br>    auto_upgrade                = bool<br>    disk_size                   = optional(number)<br>    disk_type                   = optional(string)<br>    image_type                  = optional(string)<br>    strategy                    = optional(string)<br>    max_surge                   = optional(number)<br>    max_unavailable             = optional(number)<br>    node_pool_soak_duration     = optional(string)<br>    batch_soak_duration         = optional(string)<br>    batch_percentage            = optional(number)<br>    batch_node_count            = optional(number)<br>    enable_secure_boot          = optional(bool, false)<br>    enable_integrity_monitoring = optional(bool, true)<br>  })</pre>",
      "`string`", "`string`", "`string`", "`string`", "`map(string)`",
      "`bool`", "`bool`", "`bool`", "`list(object({ state = string, key_name = string }))`",
      "`string`", "`number`", "`bool`", "`string`", "`bool`", "`bool`",
      "`bool`", "`bool`", "`bool`", "`bool`", "`bool`", "`bool`", "`bool`",
      "`bool`", "`bool`", "`bool`", "`bool`", "`bool`", "`bool`", "`bool`",
      "`bool`", "`bool`", "`bool`", "`bool`", "`bool`", "`list(string)`",
      "`number`", "`string`", "`string`", "`bool`", "`bool`", "`bool`",
      "`bool`", "`bool`", "`bool`", "`bool`", "`string`", "`number`",
      "`bool`", "`bool`", "`string`", "`string`", "`string`", "`bool`",
      "`string`", "`list(string)`", "`string`", "`string`", "`list(object({ name = string, start_time = string, end_time = string, exclusion_scope = string }))`",
      "`string`", "`string`", "`list(object({ cidr_block = string, display_name = string }))`",
      "`bool`", "`bool`", "`bool`", "`list(string)`", "`string`", "`string`",
      "`string`", "`bool`", "`string`", "`string`", "`list(string)`",
      "`string`", "`list(map(any))`", "`map(string)`", "`map(map(string))`",
      "`map(map(string))`", "`map(map(string))`", "`map(list(string))`",
      "`map(map(string))`", "`map(map(string))`", "`map(list(string))`",
      "`map(list(object({ key = string, value = string, effect = string })))`",
      "`list(string)`", "`string`", "`list(string)`", "`string`", "<pre>object({<br>    enabled            = bool<br>    logging_enabled    = optional(bool, false)<br>    monitoring_enabled = optional(bool, false)<br>  })</pre>",
      "`string`", "`bool`", "`list(string)`", "`string`", "`bool`",
      "`string`", "`string`", "`string`", "`string`", "`string`", "`bool`",
      "<pre>object({<br>    metadata = string<br>  })</pre>", "`number`",
      "`string`", "`bool`", "`map(list(string))`", "`string`", "`map(string)`",
      "`list(string)`", "`list(map(string))`", "`list(string)`"
    ),
    Default = c(
      "`false`",
      "`false`", "`false`", "`[]`", "`\"\"`", "`null`", "`null`", "<pre>{<br>  \"auto_repair\": true,<br>  \"auto_upgrade\": true,<br>  \"autoscaling_profile\": \"BALANCED\",<br>  \"disk_size\": 100,<br>  \"disk_type\": \"pd-standard\",<br>  \"enable_integrity_monitoring\": true,<br>  \"enable_secure_boot\": false,<br>  \"enabled\": false,<br>  \"gpu_resources\": [],<br>  \"image_type\": \"COS_CONTAINERD\",<br>  \"max_cpu_cores\": 0,<br>  \"max_memory_gb\": 0,<br>  \"min_cpu_cores\": 0,<br>  \"min_memory_gb\": 0<br>}</pre>",
      "`\"\"`", "`\"PROVIDER_UNSPECIFIED\"`", "`\"DNS_SCOPE_UNSPECIFIED\"`",
      "`null`", "`{}`", "`false`", "`false`", "`true`", "<pre>[<br>  {<br>    \"key_name\": \"\",<br>    \"state\": \"DECRYPTED\"<br>  }<br>]</pre>",
      "`\"DATAPATH_PROVIDER_UNSPECIFIED\"`", "`110`", "`true`", "`\"\"`",
      "`false`", "`true`", "`false`", "`false`", "`false`", "`false`",
      "`false`", "`true`", "`false`", "`false`", "`false`", "`false`",
      "`false`", "`false`", "`false`", "`true`", "`false`", "`true`",
      "`false`", "`false`", "`false`", "<pre>[<br>  \"8443\",<br>  \"9443\",<br>  \"15017\"<br>]</pre>",
      "`1000`", "`null`", "`null`", "`true`", "`null`", "`false`",
      "`false`", "`false`", "`true`", "`true`", "`\"enabled\"`", "`0`",
      "`null`", "`false`", "`\"60s\"`", "n/a", "n/a", "`false`", "`\"latest\"`",
      "`[]`", "`\"logging.googleapis.com/kubernetes\"`", "`\"\"`",
      "`[]`", "`\"\"`", "`\"05:00\"`", "`[]`", "`null`", "`false`",
      "`false`", "`[]`", "`\"monitoring.googleapis.com/kubernetes\"`",
      "n/a", "n/a", "`false`", "`\"CALICO\"`", "`\"\"`", "`[]`", "`\"GKE_METADATA\"`",
      "<pre>[<br>  {<br>    \"name\": \"default-node-pool\"<br>  }<br>]</pre>",
      "<pre>{<br>  \"all\": \"\",<br>  \"default-node-pool\": \"\"<br>}</pre>",
      "<pre>{<br>  \"all\": {},<br>  \"default-node-pool\": {}<br>}</pre>",
      "<pre>{<br>  \"all\": {},<br>  \"default-node-pool\": {}<br>}</pre>",
      "<pre>{<br>  \"all\": {},<br>  \"default-node-pool\": {}<br>}</pre>",
      "<pre>{<br>  \"all\": [<br>    \"https://www.googleapis.com/auth/cloud-platform\"<br>  ],<br>  \"default-node-pool\": []<br>}</pre>",
      "<pre>{<br>  \"all\": {},<br>  \"default-node-pool\": {}<br>}</pre>",
      "<pre>{<br>  \"all\": {},<br>  \"default-node-pool\": {}<br>}</pre>",
      "<pre>{<br>  \"all\": [],<br>  \"default-node-pool\": []<br>}</pre>",
      "<pre>{<br>  \"all\": [],<br>  \"default-node-pool\": []<br>}</pre>",
      "<pre>[<br>  \"10.0.0.0/8\",<br>  \"172.16.0.0/12\",<br>  \"192.168.0.0/16\"<br>]</pre>",
      "`\"\"`", "`[]`", "n/a", "<pre>{<br>  \"enabled\": false,<br>  \"logging_enabled\": false,<br>  \"monitoring_enabled\": false<br>}</pre>",
      "`null`", "`true`", "`[]`", "`\"REGULAR\"`", "`false`", "`\"\"`",
      "`\"DISABLED\"`", "`\"VULNERABILITY_DISABLED\"`", "`\"\"`", "`\"\"`",
      "`false`", "<pre>{<br>  \"metadata\": \"INCLUDE_ALL_METADATA\"<br>}</pre>",
      "`999`", "`\"IPV4\"`", "`false`", "`{}`", "n/a", "`{}`", "`[]`",
      "`[]`", "`[]`"
    ),
    Required = c(
      "no", "no", "no", "no", "no", "no",
      "no", "no", "no", "no", "no", "no", "no", "no", "no", "no", "no",
      "no", "no", "no", "no", "no", "no", "no", "no", "no", "no", "no",
      "no", "no", "no", "no", "no", "no", "no", "no", "no", "no", "no",
      "no", "no", "no", "no", "no", "no", "no", "no", "no", "no", "no",
      "no", "no", "no", "no", "no", "no", "no", "no", "yes", "yes",
      "no", "no", "no", "no", "no", "no", "no", "no", "no", "no", "no",
      "no", "no", "no", "yes", "yes", "no", "no", "no", "no", "no",
      "no", "no", "no", "no", "no", "no", "no", "no", "no", "no", "no",
      "no", "no", "yes", "no", "no", "no", "no", "no", "no", "no",
      "no", "no", "no", "no", "no", "no", "no", "no", "no", "no", "yes",
      "no", "no", "no", "no"
    )
  ),
  row.names = c(NA, -117L), spec = structure(list(
    cols = list(Name = structure(list(), class = c(
      "collector_character",
      "collector"
    )), Description = structure(list(), class = c(
      "collector_character",
      "collector"
    )), Type = structure(list(), class = c(
      "collector_character",
      "collector"
    )), Default = structure(list(), class = c(
      "collector_character",
      "collector"
    )), Required = structure(list(), class = c(
      "collector_character",
      "collector"
    ))), default = structure(list(), class = c(
      "collector_guess",
      "collector"
    )), delim = "|"
  ), class = "col_spec"), class = c(
    "spec_tbl_df",
    "tbl_df", "tbl", "data.frame"
  )
)


tf_tibble_2 <- structure(
  list(
    Name = c(
      "ca\\_certificate", "cluster\\_id", "dns\\_cache\\_enabled",
      "endpoint", "endpoint\\_dns", "fleet\\_membership", "gateway\\_api\\_channel",
      "horizontal\\_pod\\_autoscaling\\_enabled", "http\\_load\\_balancing\\_enabled",
      "identity\\_namespace", "identity\\_service\\_enabled", "instance\\_group\\_urls",
      "intranode\\_visibility\\_enabled", "location", "logging\\_service",
      "master\\_authorized\\_networks\\_config", "master\\_version",
      "mesh\\_certificates\\_config", "min\\_master\\_version", "monitoring\\_service",
      "name", "network\\_policy\\_enabled", "node\\_pools\\_names",
      "node\\_pools\\_versions", "region", "release\\_channel", "secret\\_manager\\_addon\\_enabled",
      "service\\_account", "tpu\\_ipv4\\_cidr\\_block", "type", "vertical\\_pod\\_autoscaling\\_enabled",
      "zones"
    ),
    Description = c(
      "Cluster ca certificate (base64 encoded)",
      "Cluster ID", "Whether DNS Cache enabled", "Cluster endpoint",
      "Cluster endpoint DNS", "Fleet membership (if registered)", "The gateway api channel of this cluster.",
      "Whether horizontal pod autoscaling enabled", "Whether http load balancing enabled",
      "Workload Identity pool", "Whether Identity Service is enabled",
      "List of GKE generated instance groups", "Whether intra-node visibility is enabled",
      "Cluster location (region if regional cluster, zone if zonal cluster)",
      "Logging service used", "Networks from which access to master is permitted",
      "Current master kubernetes version", "Mesh certificates configuration",
      "Minimum master kubernetes version", "Monitoring service used",
      "Cluster name", "Whether network policy enabled", "List of node pools names",
      "Node pool versions by node pool name", "Cluster region", "The release channel of this cluster",
      "Whether Secret Manager add-on is enabled", "The service account to default running nodes as if not overridden in `node_pools`.",
      "The IP range in CIDR notation used for the TPUs", "Cluster type (regional / zonal)",
      "Whether vertical pod autoscaling enabled", "List of zones in which the cluster resides"
    )
  ),
  row.names = c(NA, -32L), spec = structure(list(cols = list(
    Name = structure(list(), class = c(
      "collector_character",
      "collector"
    )), Description = structure(list(), class = c(
      "collector_character",
      "collector"
    ))
  ), default = structure(list(), class = c(
    "collector_guess",
    "collector"
  )), delim = "|"), class = "col_spec"), class = c(
    "spec_tbl_df",
    "tbl_df", "tbl", "data.frame"
  )
)

tf_tibble_3 <- structure(
  list(
    Name = c(
      "accelerator_count", "accelerator_type",
      "auto_repair", "autoscaling", "auto_upgrade", "boot_disk_kms_key",
      "cpu_manager_policy", "cpu_cfs_quota", "cpu_cfs_quota_period",
      "pod_pids_limit", "enable_confidential_nodes", "disk_size_gb",
      "disk_type", "effect", "enable_fast_socket", "enable_gcfs", "enable_gvnic",
      "enable_integrity_monitoring", "enable_secure_boot", "gpu_driver_version",
      "gpu_partition_size", "image_type", "initial_node_count", "insecure_kubelet_readonly_port_enabled",
      "key", "logging_variant", "local_ssd_count", "local_ssd_ephemeral_storage_count",
      "local_nvme_ssd_count", "machine_type", "min_cpu_platform", "enable_confidential_storage",
      "max_count", "total_max_count", "max_pods_per_node", "strategy",
      "threads_per_core", "enable_nested_virtualization", "max_surge",
      "max_unavailable", "node_pool_soak_duration", "batch_soak_duration",
      "batch_node_count", "batch_percentage", "min_count", "total_min_count",
      "name", "placement_policy", "pod_range", "enable_private_nodes",
      "node_count", "node_locations", "node_metadata", "preemptible",
      "spot", "service_account", "tags", "value", "version", "location_policy",
      "secondary_boot_disk", "queued_provisioning", "gpu_sharing_strategy",
      "max_shared_clients_per_gpu", "consume_reservation_type", "reservation_affinity_key",
      "reservation_affinity_values"
    ),
    Description = c(
      "The number of the guest accelerator cards exposed to this instance",
      "The accelerator type resource to expose to the instance", "Whether the nodes will be automatically repaired",
      "Configuration required by cluster autoscaler to adjust the size of the node pool to the current cluster usage",
      "Whether the nodes will be automatically upgraded", "The Customer Managed Encryption Key used to encrypt the boot disk attached to each node in the node pool. This should be of the form projects/[KEY_PROJECT_ID]/locations/[LOCATION]/keyRings/[RING_NAME]/cryptoKeys/[KEY_NAME].",
      "The CPU manager policy on the node. One of \"none\" or \"static\".",
      "Enforces the Pod's CPU limit. Setting this value to false means that the CPU limits for Pods are ignored",
      "The CPU CFS quota period value, which specifies the period of how often a cgroup's access to CPU resources should be reallocated",
      "Controls the maximum number of processes allowed to run in a pod. The value must be greater than or equal to 1024 and less than 4194304.",
      "An optional flag to enable confidential node config.", "Size of the disk attached to each node, specified in GB. The smallest allowed disk size is 10GB",
      "Type of the disk attached to each node (e.g. 'pd-standard' or 'pd-ssd')",
      "Effect for the taint", "Enable the NCCL Fast Socket feature. `enable_gvnic` must also be enabled.",
      "Google Container File System (gcfs) has to be enabled for image streaming to be active. Needs image_type to be set to COS_CONTAINERD.",
      "gVNIC (GVE) is an alternative to the virtIO-based ethernet driver. Needs a Container-Optimized OS node image.",
      "Enables monitoring and attestation of the boot integrity of the instance. The attestation is performed against the integrity policy baseline. This baseline is initially derived from the implicitly trusted boot image when the instance is created.",
      "Secure Boot helps ensure that the system only runs authentic software by verifying the digital signature of all boot components, and halting the boot process if signature verification fails.",
      "Mode for how the GPU driver is installed", "Size of partitions to create on the GPU",
      "The image type to use for this node. Note that changing the image type will delete and recreate all nodes in the node pool",
      "The initial number of nodes for the pool. In regional or multi-zonal clusters, this is the number of nodes per zone. Changing this will force recreation of the resource. Defaults to the value of min_count",
      "(boolean) Whether or not to enable the insecure Kubelet readonly port.",
      "The key required for the taint", "The type of logging agent that is deployed by default for newly created node pools in the cluster. Valid values include DEFAULT and MAX_THROUGHPUT.",
      "The amount of local SSD disks that will be attached to each cluster node and may be used as a `hostpath` volume or a `local` PersistentVolume.",
      "The amount of local SSD disks that will be attached to each cluster node and assigned as scratch space as an `emptyDir` volume. If unspecified, ephemeral storage is backed by the cluster node boot disk.",
      "Number of raw-block local NVMe SSD disks to be attached to the node.Each local SSD is 375 GB in size. If zero, it means no raw-block local NVMe SSD disks to be attached to the node.",
      "The name of a Google Compute Engine machine type", "Minimum CPU platform to be used by the nodes in the pool. The nodes may be scheduled on the specified or newer CPU platform.",
      "Enabling Confidential Storage will create boot disk with confidential mode.",
      "Maximum number of nodes in the NodePool. Must be >= min_count. Cannot be used with total limits.",
      "Total maximum number of nodes in the NodePool. Must be >= min_count. Cannot be used with per zone limits.",
      "The maximum number of pods per node in this cluster", "The upgrade stragey to be used for upgrading the nodes. Valid values of state are: `SURGE` or `BLUE_GREEN`",
      "Optional The number of threads per physical core. To disable simultaneous multithreading (SMT) set this to 1. If unset, the maximum number of threads supported per core by the underlying processor is assumed",
      "Whether the node should have nested virtualization", "The number of additional nodes that can be added to the node pool during an upgrade. Increasing max_surge raises the number of nodes that can be upgraded simultaneously. Can be set to 0 or greater. Only works with `SURGE` strategy.",
      "The number of nodes that can be simultaneously unavailable during an upgrade. Increasing max_unavailable raises the number of nodes that can be upgraded in parallel. Can be set to 0 or greater. Only works with `SURGE` strategy.",
      "Time needed after draining the entire blue pool. After this period, the blue pool will be cleaned up. By default, it is set to one hour (3600 seconds). The maximum length of the soak time is 7 days (604,800 seconds). Only works with `BLUE_GREEN` strategy.",
      "Soak time after each batch gets drained, with the default being zero seconds. Only works with `BLUE_GREEN` strategy.",
      "Absolute number of nodes to drain in a batch. If it is set to zero, this phase will be skipped. Cannot be used together with `batch_percentage`. Only works with `BLUE_GREEN` strategy.",
      "Percentage of nodes to drain in a batch. Must be in the range of [0.0, 1.0]. If it is set to zero, this phase will be skipped. Cannot be used together with `batch_node_count`. Only works with `BLUE_GREEN` strategy.",
      "Minimum number of nodes in the NodePool. Must be >=0 and <= max_count. Should be used when autoscaling is true. Cannot be used with total limits.",
      "Total minimum number of nodes in the NodePool. Must be >=0 and <= max_count. Should be used when autoscaling is true. Cannot be used with per zone limits.",
      "The name of the node pool", "Placement type to set for nodes in a node pool. Can be set as [COMPACT](https://cloud.google.com/kubernetes-engine/docs/how-to/compact-placement#overview) if desired",
      "The name of the secondary range for pod IPs.", "Whether nodes have internal IP addresses only.",
      "The number of nodes in the nodepool when autoscaling is false. Otherwise defaults to 1. Only valid for non-autoscaling clusters",
      "The list of zones in which the cluster's nodes are located. Nodes must be in the region of their regional cluster or in the same region as their cluster's zone for zonal clusters. Defaults to cluster level node locations if nothing is specified",
      "Options to expose the node metadata to the workload running on the node",
      "A boolean that represents whether or not the underlying node VMs are preemptible",
      "A boolean that represents whether the underlying node VMs are spot",
      "The service account to be used by the Node VMs", "The list of instance tags applied to all nodes",
      "The value for the taint", "The Kubernetes version for the nodes in this pool. Should only be set if auto_upgrade is false",
      "[Location policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool#location_policy) specifies the algorithm used when scaling-up the node pool. Location policy is supported only in 1.24.1+ clusters.",
      "Image of a secondary boot disk to preload container images and data on new nodes. For detail see [documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster#nested_secondary_boot_disks). `gcfs_config` must be `enabled=true` for this feature to work.",
      "Makes nodes obtainable through the ProvisioningRequest API exclusively.",
      "The type of GPU sharing strategy to enable on the GPU node. Accepted values are: \"TIME_SHARING\" and \"MPS\".",
      "The maximum number of containers that can share a GPU.", "The type of reservation consumption. Accepted values are: \"UNSPECIFIED\": Default value (should not be specified). \"NO_RESERVATION\": Do not consume from any reserved capacity, \"ANY_RESERVATION\": Consume any reservation available, \"SPECIFIC_RESERVATION\": Must consume from a specific reservation. Must specify key value fields for specifying the reservations.",
      "The label key of a reservation resource. To target a SPECIFIC_RESERVATION by name, specify \"compute.googleapis.com/reservation-name\" as the key and specify the name of your reservation as its value.",
      "The list of label values of reservation resources. For example: the name of the specific reservation when using a key of \"compute.googleapis.com/reservation-name\". This should be passed as comma separated string."
    ),
    Default = c(
      "0", NA, "true", "true", "true (if cluster is regional)",
      NA, "static", "null", "null", "null", "false", "100", "pd-standard",
      NA, "null", "false", "false", "true", "false", "null", "null",
      "COS_CONTAINERD", NA, "null", NA, "DEFAULT", "0", "0", "0", "e2-medium",
      NA, "false", "100", "null", "null", "SURGE", "null", "null",
      "1", "0", "3600s", "0s", "1", "null", "1", "null", NA, NA, NA,
      NA, NA, NA, NA, "false", "false", NA, NA, NA, NA, NA, NA, NA,
      NA, NA, NA, NA, NA
    ),
    Requirement = c(
      "Optional", "Optional",
      "Optional", "Optional", "Optional", "Optional", "Optional", "Optional",
      "Optional", "Optional", "Optional", "Optional", "Optional", "Required",
      "Optional", "Optional", "Optional", "Optional", "Optional", "Optional",
      "Optional", "Optional", "Optional", "Optional", "Required", "Optional",
      "Optional", "Optional", "Optional", "Optional", "Optional", "Optional",
      "Optional", "Optional", "Optional", "Optional", "Optional", "Optional",
      "Optional", "Optional", "Optional", "Optional", "Optional", "Optional",
      "Optional", "Optional", "Required", "Optional", "Optional", "Optional",
      "Required", "Optional", "Optional", "Optional", "Optional", "Optional",
      "Required", "Required", "Optional", "Optional", "Optional", "Optional",
      "Optional", "Optional", "Optional", "Optional", "Optional"
    )
  ),
  row.names = c(
    NA,
    -67L
  ), spec = structure(list(cols = list(Name = structure(list(), class = c(
    "collector_character",
    "collector"
  )), Description = structure(list(), class = c(
    "collector_character",
    "collector"
  )), Default = structure(list(), class = c(
    "collector_character",
    "collector"
  )), Requirement = structure(list(), class = c(
    "collector_character",
    "collector"
  ))), default = structure(list(), class = c(
    "collector_guess",
    "collector"
  )), delim = "|"), class = "col_spec"), class = c(
    "spec_tbl_df",
    "tbl_df", "tbl", "data.frame"
  )
)
