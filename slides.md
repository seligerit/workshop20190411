### Themenquerschnitt

> DevOps

> Infrastucture as Code

> Container (Docker)

> Containerplattform (Kubernetes)

---

### Was ist eigentlich „DevOps“?
![container](img/devops-define-roles.jpg)

--

### Was manche sagen ...
* Ops: *„Entwickler die auch Ops machen, aber halt nicht richtig...“*
* Dev: *„Dann müssen wir ja auch noch Ops machen!!1!1“*
* Management: *„Toll, da brauche ich nur noch halb soviel Leute!“*

--

### Definition
*„DevOps is the practice of operations and development engineers participating together in the entire service lifecycle, from design through the development process to production support.“* [🔗](https://theagileadmin.com/what-is-devops/)

--

### Definition

*„DevOps is also characterized by operations staff making use many of the same techniques as developers for their systems work.“* [🔗](https://theagileadmin.com/what-is-devops/)

--

### Definition
*„You build it, you run it!“* [🔗](https://devops.com/adding-accountability-you-build-you-run/)

Note:
* Interdisziplinär
* Agile Werte, agile Prinzipien, agile Methoden, agile Tools

--

### Mehr zu DevOps ...

[https://theagileadmin.com/what-is-devops/](https://theagileadmin.com/what-is-devops/)

---

### „Infrastructure as Code“?
![container](img/infrastructure-as-code.jpg)

--

### Infrastruktur?

--

### Klar ...
* Server
* Netzwerkkomponenten
* Storage
* ...

--

### Aber auch ...
* VMs
* Servicekonfiguration: Apache, DNS, Mail, ...
* Zugangsverwaltung, Zertifikate, ...
*...

--

### Workflow: Installation Apache
<pre><code data-trim data-noescape class="bash">
apt-get update
apt-get install apache2
vim /etc/apache2/apache.conf
systemctl restart apache2
</code></pre>

--

### Wie entwickeln wir Software?
* Code schreiben
* Versionskontrolle: Commit, Merge, Clone, Pull Request,  ...
* Testsuite laufen lassen
* Releaseartefakt bauen
* Ausspielen auf Testsystem
* ...

--

### Infrastructure as Code:
„Wir benutzen die Vorgehensweisen, die sich bereits in der
Softwarentwicklung bewährt haben.“

--

### Infrastructure as Code (IaC):
* Versionskontrolle
* Wiederverwendbarkeit
* Automatisierung
* Standardtools

--

### WIDIWIG

„What I describe, is what I get“

--

### Workflow: Installation Apache

<pre><code data-trim data-noescape class="salt">
apache2:
  pkg.installed

apache2 Service:
  service.running:
    - name: apache2
    - enable: True
    - require:
      - pkg: apache2
...
</pre></code>
<pre><code data-trim data-noescape class="bash">
salt '*' state.apply
</pre></code>

--

### Konfigurationsmanagement
* Puppet [🔗](https://puppet.com/)
* Chef [🔗](https://www.chef.io/)
* Ansible [🔗](https://www.ansible.com/)
* Saltstack [🔗](https://www.saltstack.com/)

--

### VM Images
* Packer [🔗](https://www.packer.io/)
* Boxfuse [🔗](https://boxfuse.com/)
* Veewee [🔗](https://github.com/jedi4ever/veewee)

--

### IaC Tools
* Terraform [🔗](https://www.terraform.io/)
* Openstack Heat [🔗](https://docs.openstack.org/heat/latest/)
* AWS Cloudformation [🔗](https://aws.amazon.com/cloudformation/)
* Google Deployment Manager [🔗](https://cloud.google.com/deployment-manager/)

--

### Reifegrade IaC (laut Terraform)
1. From Manual Changes to Semi-Automation

2. From Semi-Automation to Infrastructure as Code

3. From Infrastructure as Code to Collaborative Infrastructure as Code

4. Advanced Improvements to Collaborative Infrastructure as Code

--

### Cloud + IaC = ♥

<pre><code data-trim data-noescape>
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnet" {
  count = 3
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = "${aws_vpc.vpc.id}"
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route" "default_gw" {
  route_table_id = "${aws_route_table.route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.gateway.id}"
}
</pre></code>

---

### Container
<p class="stretch"><img src="img/container.jpg"></p>

--

### Container? Docker?

***Docker***: „an open source project to
***pack***, ***ship*** and ***run*** every application
as a ***lightweight container***.“

--

### Container!


--

### Virtualisierung
<p class="stretch"><img src="img/classic_virtualization.svg"></p>

--

### Containerisierung
<p class="stretch"><img src="img/containers.svg"></p>

--

### Container Layers
<p class="stretch"><img src="img/container-layers.jpg"></p>


--
### Docker
<p class="stretch"><img src="img/docker_stack.svg"></p>

---

### Kubernetes
<p class="stretch"><img src="img/kubernetes.jpg"></p>