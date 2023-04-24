## Week-8 task ##

#### Commands used in this task: ####

1. Creating AWS profile
    
    ```
    aws configure
    ```

    When prompted, access and secret keys are added that will be used with the profile

2. Creating DNS record 

    ```
    aws route53 change-resource-record-sets --hosted-zone-id Z3LHP8UIUC8CDK --change-batch'{"Changes":[{"Action":"UPSERT","ResourceRecordSet":{"Name":"aleksandar-stojkovic.awsbosnia.com.","Type":"A","TTL":60,"ResourceRecords":[{"Value":"12.13.14.15"}]}}]}'` --profile aws-bosnia
    ```

    This command updated (added) record set with new A record that will target IP address of the server when domain aleksandar-stojkovic.awsbosnia.com is used. Another version of this command is used in this task:
    ```
    aws route53 change-resource-record-sets --hosted-zone-id Z3LHP8UIUC8CDK --change-batch file://C:\\awsdns.json --profile aws-bosnia
    ```

    This command is the same as the one mentioned above but this one is using json file on location C:\ under the name awsdns.json

3. Checking DNS records
    ```
    aws route53 list-resource-record-sets --hosted-zone-id Z3LHP8UIUC8CDK --profile aws-bosnia
    ```

4. Creating Let's Encrypt certificate on server and add autorenewal cron job

    ```
    sudo dnf install python3 augeas-libs
    sudo python3 -m venv /opt/certbot/
    sudo /opt/certbot/bin/pip install --upgrade pip
    sudo /opt/certbot/bin/pip install certbot certbot-nginx
    sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
    sudo certbot certonly --nginx 
    echo "0 0,12 * * * root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && sudo certbot renew -q" | sudo tee -a /etc/crontab > /dev/null
    ```

5. Show which SSL certificate is used on EC2 instance and validity date
    ```
    openssl x509 -in cert.pem -text -noout
    ```

6. Show which certificate is used on domain and validity date
    ```
    openssl s_client -connect aleksandar-stojkovic.awsbosnia.com:443
    ```

