#Get Providers

    az provider list

# Get Providers Count

    az provider list -o tsv | wc -l


# Resource Types

    az provider list --query "[?namespace=='Microsoft.Compute'].resourceTypes[].resourceType"


# API

    az provider list --query "[?namespace=='Microsoft.Compute'].resourceTypes[]|[?resourceType=='virtualMachines'].apiVersions"


# Locations

    az provider list --query "[?namespace=='Microsoft.Compute'].resourceTypes[]|[?resourceType=='virtualMachines'].locations"
