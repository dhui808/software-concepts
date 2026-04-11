### Microservice call to an external vendor API
Combination of Azure API Management (APIM) for logic and Azure NAT Gateway for networking.  

---

## 1. The Hub-and-Spoke Networking Pattern
* **The Spoke:** Your microservice (running on AKS, App Service, or Container Apps) sits in a "Spoke" Virtual Network (VNet).
* **The Hub:** A central VNet containing shared networking resources like Firewalls or Gateways.

`Microservice` $\rightarrow$ `Internal Load Balancer/APIM` $\rightarrow$ `Azure Firewall` $\rightarrow$ `NAT Gateway (Static IP)` $\rightarrow$ `Vendor API`

---

## 2. Key Components

### A. Azure NAT Gateway (The "Networking" Layer)
When a microservice calls an external API, the vendor usually requires an **IP Allowlister**. 
* Standard Azure outbound traffic often uses random dynamic IPs.
* **Solution:** Attaching a **NAT Gateway** to your microservice's subnet provides a **static Public IP**. The vendor can whitelist it in their firewall.

### B. Azure API Management - APIM (The "Logic" Layer)
APIM serves as an **Outbound Proxy**.
* **Anti-Corruption Layer:** If the vendor changes their API format, you only update the mapping in APIM, not in every microservice.
* **Secret Management:** APIM handles the vendor's API keys or OAuth tokens (often stored in **Azure Key Vault**), so your microservices never see the raw credentials.
* **Caching & Throttling:** You can cache vendor responses to save costs and implement rate-limiting to ensure you don't exceed your vendor contract limits.

### C. Azure Firewall (The "Security" Layer)
For high-security environments, traffic is routed through **Azure Firewall**. 
* It performs **FQDN Filtering**, ensuring your microservices can *only* talk to `api.vendor.com` and nowhere else on the internet, preventing data exfiltration.

---

## 3. Architecture Comparison Table

| Requirement | Solution | Benefit |
| :--- | :--- | :--- |
| **Fixed IP for Vendor** | Azure NAT Gateway | Prevents connection drops and simplifies whitelisting. |
| **Security / Filtering** | Azure Firewall | Restricts outbound traffic to specific URLs (FQDNs). |
| **Credential Safety** | Azure Key Vault | Stores vendor API keys securely. |
| **Abstraction** | API Management | Decouples microservices from vendor API changes. |

---

## 4. Summary of the "Best Practice" Workflow
1.  **Request:** Microservice A sends a request to an internal APIM endpoint (e.g., `https://api.company.com/vendor-proxy`).
2.  **Transformation:** APIM injects the API key from Key Vault and converts the internal JSON format to the vendor’s requirements.
3.  **Egress:** The traffic leaves the Azure VNet via the **NAT Gateway**, carrying a **Static IP**.
4.  **Delivery:** The Vendor API receives the request from a known, trusted IP and processes it.

> **Note:** If the vendor is also on Azure, consider using **Azure Private Link**. This allows you to talk to their service over the private Microsoft backbone, bypassing the public internet entirely.
