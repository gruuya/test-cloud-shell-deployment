def generate_config(context):
    resources = [{
        "name": "attach-edit-role",
        "type": "gcp-types/cloudresourcemanager-v1:virtual.projects.iamMemberBinding",
        "properties": {
            "resource": context.env["project"],
            "role": "roles/editor",
            "member": "serviceAccount:" + context.properties["serviceAccountEmail"]
            }
        }]
    return {"resources": resources}
