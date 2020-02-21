resource "aws_instance" "ec2-server" {
  ami           = "ami-0c322300a1dd5dc79"
  instance_type = var.instanceyotype
  key_name      = "terraform-key"
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./terraform-key.pem")
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo pip install ansible",
      "sudo yum install java-1.8.0 -y",
      "sudo yum remove java-1.7.0-openjdk -y",
      "sudo yum install wget -y",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo",
      "sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key",
      "sudo yum install jenkins -y",
      "sudo service jenkins start",
      "sudo chkconfig --add jenkins"
    ]
  }
  tags = {
    Name = "Jenkins-Server"
  }       
  }

  

 

  

 

  