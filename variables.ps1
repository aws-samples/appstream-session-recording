# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

$BUCKET_NAME = "bucket-name"  # Name of the bucket where logs and videos are stored
$BUCKET_REGION = "region"  # Region where resides your bucket
$BUCKET_PREFIX = ""  # Must be empty or end with a /
$VIDEO_MAX_DURATION = 300  # Max duration of the videos that Ffmpeg generates
$FRAME_RATE = 5  # Frames per second