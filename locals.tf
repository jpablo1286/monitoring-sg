locals {
    security_groups = {
        monitoring = {
            name = "monit_clients_sg"
            description = "Monit Clients Access"
            ingress = {
                clients = {
                    from = 5665
                    to = 5665
                    protocol = "tcp"
                    cidr_blocks = var.icinga_clients_ips
                }
                http = {
                    from = 80
                    to = 80
                    protocol = "tcp"
                    cidr_blocks = var.icinga_web_access_ips
                }
                https = {
                    from = 443
                    to = 443
                    protocol = "tcp"
                    cidr_blocks = var.icinga_web_access_ips
                }
            }
        },
        admin = {
            name = "admin_monit_sg"
            description = "Monitoring Admin Access"
            ingress = {
                mysql = {
                    from = 22
                    to = 22
                    protocol = "tcp"
                    cidr_blocks = var.icinga_ssh_access_ips
                }
            }
        }
    }
}