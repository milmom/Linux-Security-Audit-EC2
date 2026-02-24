# Linux Security Audit Findings
**Target System:** AWS EC2 Ubuntu 22.04 LTS  
**Audit Type:** Baseline Security Hardening & Configuration Review  
**Date:** February 2026  

---

## 1. Network Exposure Assessment

### Findings:
- Only TCP port 22 (SSH) is listening.
- No HTTP, HTTPS, database, or application ports exposed.
- AWS Security Group restricts SSH access to a single trusted IP address (/32 CIDR).

### Risk Level:
Low

### Recommendation:
Maintain strict inbound rule restrictions and avoid exposing additional services without firewall controls.

---

## 2. Host-Based Firewall Configuration

### Findings:
- UFW (Uncomplicated Firewall) enabled.
- Only OpenSSH explicitly allowed.
- Default deny policy enforced for unsolicited inbound traffic.

### Risk Level:
Low

### Recommendation:
Continue using host-based firewall alongside AWS Security Groups for defense-in-depth.

---

## 3. SSH Hardening Review

### Findings:
- PermitRootLogin disabled.
- PasswordAuthentication disabled.
- Public key authentication enforced.
- Root account locked.

### Risk Level:
Low

### Security Impact:
Mitigates brute-force attacks, credential stuffing, and direct root compromise.

---

## 4. Privilege & Account Review

### Findings:
- Only one sudo-enabled account present.
- No unnecessary privileged users.
- Root account locked at system level.

### Risk Level:
Low

### Recommendation:
Maintain least-privilege access model.

---

## 5. Running Services Enumeration

### Findings:
- Minimal required services running.
- No web servers (Apache/Nginx).
- No database services.
- No container runtimes.

### Risk Level:
Low

### Recommendation:
Disable unnecessary services if installed in future deployments.

---

## 6. File Permission Audit

### Findings:
- No unsafe world-writable files identified.
- /proc entries observed are expected kernel virtual filesystem entries.

### Risk Level:
Low

---

## 7. Patch Management

### Findings:
- System updated.
- Unattended security upgrades enabled.

### Risk Level:
Low

---

# Overall Security Posture

The EC2 Ubuntu instance demonstrates strong baseline hardening controls, proper access restriction, minimal service exposure, and adherence to cloud security best practices.

This system is considered hardened against common misconfiguration-based attacks and unauthorized remote access.
