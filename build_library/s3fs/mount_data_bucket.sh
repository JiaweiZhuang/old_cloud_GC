#!/bin/bash
# Note on bucket naming:
# https://github.com/s3fs-fuse/s3fs-fuse/issues/332
# Note on IAM roles:
# https://serverfault.com/questions/441691/how-to-make-s3fs-work-with-iam-roles
# TODO: mount public GC
# Note on requester-pay buckets
# https://github.com/s3fs-fuse/s3fs-fuse/issues/635
s3fs -o use_path_request_style,umask=022,iam_role=auto my_GCv11-02d_data gcdata
