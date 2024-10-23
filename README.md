Here are all the kubectl patch commands you need to quickly update resource requests and limits for the Longhorn components. These commands will apply memory and CPU requests and limits to the Longhorn Manager, CSI Attacher, CSI Provisioner, CSI Resizer, and CSI Snapshotter.

Step 1: Patch Longhorn Manager
bash
Copy code
kubectl patch deployment longhorn-manager -n longhorn-system --patch '
spec:
  template:
    spec:
      containers:
      - name: longhorn-manager
        resources:
          requests:
            memory: "512Mi"
            cpu: "500m"
          limits:
            memory: "1Gi"
            cpu: "1"
'
Step 2: Patch CSI Attacher
bash
Copy code
kubectl patch deployment csi-attacher -n longhorn-system --patch '
spec:
  template:
    spec:
      containers:
      - name: csi-attacher
        resources:
          requests:
            memory: "128Mi"
            cpu: "100m"
          limits:
            memory: "256Mi"
            cpu: "500m"
'
Step 3: Patch CSI Provisioner
bash
Copy code
kubectl patch deployment csi-provisioner -n longhorn-system --patch '
spec:
  template:
    spec:
      containers:
      - name: csi-provisioner
        resources:
          requests:
            memory: "128Mi"
            cpu: "100m"
          limits:
            memory: "256Mi"
            cpu: "500m"
'
Step 4: Patch CSI Resizer
bash
Copy code
kubectl patch deployment csi-resizer -n longhorn-system --patch '
spec:
  template:
    spec:
      containers:
      - name: csi-resizer
        resources:
          requests:
            memory: "128Mi"
            cpu: "100m"
          limits:
            memory: "256Mi"
            cpu: "500m"
'
Step 5: Patch CSI Snapshotter
bash
Copy code
kubectl patch deployment csi-snapshotter -n longhorn-system --patch '
spec:
  template:
    spec:
      containers:
      - name: csi-snapshotter
        resources:
          requests:
            memory: "128Mi"
            cpu: "100m"
          limits:
            memory: "256Mi"
            cpu: "500m"
'
Step 6: Verify Changes
After applying the above patch commands, verify that the resource requests and limits are applied to the pods. Use the following command to describe the pods and check the resources section:

bash
Copy code
kubectl describe pod <pod-name> -n longhorn-system
Summary:
These commands update the resource requests and limits for each Longhorn component.
Use kubectl describe to verify the changes after applying the patches.
For persistent changes across Helm upgrades, remember to modify the Helm values.yaml file as described earlier.
Let me know if you need further assistance
