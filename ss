airflow:
  dags:
    persistence:
      enabled: true
      existingClaim: ""
      storageClassName: longhorn
      accessMode: ReadWriteMany
      size: 10Gi  # Adjust to the size you want for DAGs

  logs:
    persistence:
      enabled: true
      existingClaim: ""
      storageClassName: longhorn
      accessMode: ReadWriteMany
      size: 10Gi  # Adjust to the size you want for Logs

  airflow:
    extraVolumeMounts: []
    extraVolumes: []
    config:
      AIRFLOW__OPENMETADATA_AIRFLOW_APIS__DAG_GENERATED_CONFIGS: "/opt/airflow/dags"
