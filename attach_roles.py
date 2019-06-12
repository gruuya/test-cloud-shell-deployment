def generate_config(context):
    roles_to_attach = [
        "roles/compute.instanceAdmin",
        "roles/compute.networkAdmin",
        "roles/compute.securityAdmin",
        "roles/compute.storageAdmin",
        "roles/dns.admin"
        ]

    resources = []
    for role in roles_to_attach:
        resources.append({
            "name": "Frame Workload " + role,
            "type": "gcp-types/cloudresourcemanager-v1:virtual.projects.iamMemberBinding",
            "properties": {
                "resource": context.env["project"],
                "role": role,
                "member": "1018189488659-compute@developer.gserviceaccount.com"
                }
            })
    return {"resources": resources}
