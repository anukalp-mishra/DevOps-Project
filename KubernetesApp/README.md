<h1>Deployment on K8s cluster using Jenkins CI-CD</h1>
<h2>Prerequisite for this K8s WebApp server project.</h2>
<p>Pre-requisites : Git, Linux, Jenkins, Docker, DockerHub Registry, Ansible, 
Kubernetes (Deployment & Services)</p>

3 EC2 instances:
<li>
1. Jenkins Server (default JRE + Jenkins)
2. Ansible (Python+Ansible+Docker)
3. WebApp (K8s cluster) --> (Docker+Minikube)
</li>