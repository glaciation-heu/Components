#!/bin/bash

# Set Up Kafka Using Helm

# Add the Bitnami Helm Chart Repository
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Install Kafka
helm install kafka bitnami/kafka

# Accessing Kafka

# Create a Kafka client
kubectl run kafka-client --restart='Never' --image docker.io/bitnami/kafka:latest --namespace default --command -- sleep infinity

# Provide a pause and message for the user before proceeding
echo "Waiting for a few seconds to ensure the Kafka client pod is up..."
sleep 20

# Access the client (this will open a shell inside the Kafka client pod)
echo "Accessing the Kafka client pod. You can run Kafka commands from here."
kubectl exec --tty -i kafka-client --namespace default -- bash

# Note: The script will pause here until the user exits the Kafka client pod shell.

# Print out next steps for the user
echo "Next Steps:"
echo "- Consider setting up monitoring for your Kafka cluster using tools like Prometheus and Grafana."
echo "- Ensure that your Kafka cluster is secure. Set up authentication, authorization, and encryption."
echo "- By default, Kafka has persistence enabled. Ensure you have backup and recovery procedures."
echo "- Scale your Kafka brokers and adjust configurations as needed."


