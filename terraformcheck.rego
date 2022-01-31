package main

import input as tfplan

deny[reason] {
    r := tfplan.resource_changes[_]
    r.mode == "managed"
    r.type == "aws_s3_bucket"
    r.change.after.acl == "public-read-write"

    reason := sprintf("%-40s :: S3 buckets must not be PUBLIC", [r.address])
}

deny[reason] {
    r := tfplan.resource_changes[_]
    r.mode == "managed"
    r.type == "aws_s3_bucket"
    r.change.after.versioning[_].enabled == false

    reason := sprintf("%-40s :: S3 buckets must have VERSIONING", [r.address])
}

deny[reason] {
    r := tfplan.resource_changes[_]
    r.mode == "managed"
    r.type == "aws_s3_bucket"
    r.change.after.versioning[_].mfa_delete == "public-read-write"

    reason := sprintf("%-40s :: S3 buckets must have MFA_DELETE", [r.address])
}