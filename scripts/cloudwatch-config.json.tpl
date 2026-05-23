{
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/messages",
            "log_group_name": "/ec2/${environment}",
            "log_stream_name": "{instance_id}-messages"
          },
          {
            "file_path": "/var/log/cloud-init.log",
            "log_group_name": "/ec2/${environment}",
            "log_stream_name": "{instance_id}-cloud-init"
          }
        ]
      }
    }
  }
}