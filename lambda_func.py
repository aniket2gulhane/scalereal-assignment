import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('employee')

s3_client = boto3.client("s3")

def import_csv (event, context):
    bucket_name = event ['Records'][0]['s3']['bucket']['name']
    s3_file_name = event ['Records'][0]['s3']['object']['key']
    resp = s3_client.get_object(Bucket=bucket_name, Key=s3_file_name)
    data = resp ['Body'].read().decode("utf-8")
    employ = data.split("\n")
    for emp in employ:
        print(emp)
        emp_data = emp.split(",")
        #add datat to dyanamoDB
        table.put_item(
            Item = {
                "Id" : emp_data[0],
                "Name" : emp_data[1],
                "Location" : emp_data[2]
            }
            )