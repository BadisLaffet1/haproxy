airflow:
  airflow:
    extraVolumeMounts:
      - mountPath: /airflow-logs
        name: longhorn-airflow-logs
      - mountPath: /airflow-dags/dags
        name: longhorn-airflow-dags
    extraVolumes:
      - name: longhorn-airflow-logs
        persistentVolumeClaim:
          claimName: openmetadata-dependencies-logs
      - name: longhorn-airflow-dags
        persistentVolumeClaim:
          claimName: openmetadata-dependencies-dags
    config:
      AIRFLOW__OPENMETADATA_AIRFLOW_APIS__DAG_GENERATED_CONFIGS: "/airflow-dags/dags"

  dags:
    path: /airflow-dags/dags
    persistence:
      enabled: false

  logs:
    path: /airflow-logs
    persistence:
      enabled: false
