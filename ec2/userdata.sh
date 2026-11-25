
#!/bin/bash

dnf install nginx -y

rm -rf /usr/share/nginx/html/*

cat > /usr/share/nginx/html/index.html <<'HTML'
<!DOCTYPE html>
<html>
<head>
    <title>My AWS Application</title>
</head>
<body>
    <h1>Welcome to Narayana's Application!</h1>
    <h2>Running on AWS EC2</h2>
    <p>Deployed using Terraform and Nginx.</p>
</body>
</html>
HTML

systemctl enable nginx
systemctl start nginx
