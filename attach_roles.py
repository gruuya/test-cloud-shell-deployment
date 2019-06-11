def generate_config(context):
    roles_to_attach = [
        "roles/compute.instanceAdmin",
        "roles/compute.networkAdmin",
        "roles/compute.securityAdmin",
        "roles/compute.storageAdmin",
        "roles/dns.admin",
        "roles/iam.serviceAccountKeyAdmin",  # for fixed credentials only
        "roles/iam.serviceAccountTokenCreator",  # for temp credentials only
        "roles/iam.serviceAccountUser"  # for temp credentials only
        ]

    resources = []
    for role in roles_to_attach:
        resources.append({
            "name": "Frame Workload " + role,
            "type": "gcp-types/cloudresourcemanager-v1:virtual.projects.iamMemberBinding",
            "properties": {
                "resource": context.env["project"],
                "role": role,
                "member": "serviceAccount:" + context.properties["serviceAccountEmail"]
                }
            })
    return {"resources": resources}
