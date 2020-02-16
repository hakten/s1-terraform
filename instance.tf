resource "aws_instance" "tomcat" {
  instance_type          = "t2.micro"
  ami                    = "${data.aws_ami.centos.id}"
  key_name               = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.tomcat.id}"]
  
  
  tags = {
    Name = "Apache Tomcat"
  }

  #user_data = file("./files/userdata-db")

  provisioner "file" {
    source      = "tomcat/"
    destination = "/tmp"

    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "centos"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }

  provisioner "remote-exec" {
    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "centos"
      private_key = "${file("~/.ssh/id_rsa")}"
      }
      inline = [
        "sudo yum install java-1.8* -y &&",
        "echo JAVA_HOME=`find /usr/lib/jvm/java-1.8* | head -n 3|tail -n1` >> ~/.bash_profile",
        "cd /opt && sudo yum install wget -y &&",
        "sudo wget -P /opt https://downloads.apache.org/tomcat/tomcat-8/v8.5.51/bin/apache-tomcat-8.5.51.tar.gz &&",
        "sudo tar -xvzf /opt/apache-tomcat-8.5.51.tar.gz &&",
        "sudo cp -f /tmp/context.xml /opt/apache-tomcat-8.5.51/webapps/manager/META-INF/context.xml &&",
        "sudo cp -f /tmp/context.xml /opt/apache-tomcat-8.5.51/webapps/host-manager/META-INF/context.xml &&",
        "sudo cp -f /tmp/tomcat-users.xml /opt/apache-tomcat-8.5.51/conf/tomcat-users.xml &&",
        "sudo rm -f /tmp/context.xml &&",
        "sudo rm -f /tmp/tomcat-users.xml &&",
        "sudo chmod 775 /opt/apache-tomcat-8.5.51/bin/shutdown.sh &&",
        "sudo chmod 775 /opt/apache-tomcat-8.5.51/bin/startup.sh &&",
        "sudo sleep 10 &&",
        "sudo /opt/apache-tomcat-8.5.51/bin/startup.sh"
        
        ]
      } 
   
}
