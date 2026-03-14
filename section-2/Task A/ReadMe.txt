Root couse:
--------------

A 502 Bad Gateway in this context means Nginx (the "Gateway") tried to connect to the web service but the connection was refused. - conflicting port configurations


FIX: 
--------------

server {
    listen 80;

    location / {
        # Change 8080 to 3000
        proxy_pass http://web:3000;




How to Prevent This in Production:
- Use Environment Variables:
- Health Checks
-Standardize Internal Ports